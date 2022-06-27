package com.javalec.team.controller;

import com.javalec.team.AppConfig;
import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.*;
import com.javalec.team.service.Res_Movie_SeatService;
import com.javalec.team.service.Res_movie_ListService;
import com.javalec.team.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Res_movie_Controller {

    AppConfig appConfig = new AppConfig();
    public JdbcTemplate template;
    Res_movie_ListService ReserveService;
    Res_Movie_SeatService SeatService;
    Res_Movie_Reserve_Dao dao;

    @Autowired
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
        Constant.template =this.template;
    }

//Main -> Ticketing
    @RequestMapping("reservation")
    public String respage(Model model){
        ReserveService = appConfig.reserveList(); 
        ReserveService.listMovie(model); 
        return "reserve/reserve";
    }
    
  //to MainPage after payment
    @RequestMapping("seats/main")
    public String nextt(){
        return "main/index";
    }

    /*==================== Ticketing ====================*/
    @RequestMapping("reservation/theaterlist")
    @ResponseBody
    public List<TheaterDTO> getTheatherList(HttpServletRequest req){
        String Rcode = req.getParameter("Rcode"); 
        ReserveService = appConfig.reserveList();
        List<TheaterDTO> tlist = ReserveService.findTheaterByRegionCode(Rcode);
        return tlist;
    }

    @RequestMapping("reservation/timetable")
    @ResponseBody
    public List<HtimeDTO> getTimeAndHall(HttpServletRequest req){
        String Mcode = req.getParameter("Mcode");
        ReserveService = appConfig.reserveList();
        List<HtimeDTO> HallTimeList = ReserveService.findTheaterByMovie(Mcode);
        return HallTimeList;
    }

    /*==================== Seat ====================*/
    @RequestMapping("seats")
    public String selectSeat(HttpServletRequest req, HttpServletResponse response, Model model){
        response.setHeader("Content-Type","text/html;charset=utf-8");
        SeatService = appConfig.seatService();
        dao = appConfig.dao();
        String Mname = req.getParameter("SresultName");  //��ȭ ����
        String Tname = req.getParameter("SresultTheater"); //��ȭ�� ��
        String Rname = req.getParameter("SresultRegion"); //���� ��
        String Mcode = req.getParameter("SresultNameCode"); //��ȭ �ڵ�
        String Sdate = req.getParameter("SresultDate"); //���� ��¥
        String Shall = req.getParameter("SresultHall"); //�󿵰� ��ȣ
        String Stime = req.getParameter("SresultTime"); //��ȭ �ð�
        String Tcode = req.getParameter("SresultTheaterCode"); //��ȭ�� ��ȣ
        MovieMemory mm = new MovieMemory(Tcode, Mname, Tname, Rname, Sdate, Shall, Stime, Mcode);
        model.addAttribute("ReserveDetail",mm);
        SeatService.findAllSeats(Mcode, Sdate, Stime, Tcode, model);

        int jVali = SeatService.findJvalidation(Shall, Stime);

        ArrayList<Integer> priceList = SeatService.findPriceInfo(jVali);
        for (int i =0;i< priceList.size();i++){
            priceList.get(i);
        }
        ArrayList<SeatDTO> slist = dao.getSeatInfo(Shall);

        model.addAttribute("rst",jVali);
        model.addAttribute("sInfo",slist);
        model.addAttribute("pList",priceList); 
        return "reserve/seat";
    }

    @RequestMapping("seats/payment")
    public void gt(HttpServletRequest req, HttpServletResponse response){
        response.setHeader("Content-Type","text/html;charset=utf-8");
        SeatService = appConfig.seatService();

        String hNum = req.getParameter("hNum");
        String uid = req.getParameter("uid");
        String seats = req.getParameter("seats");
        String mcode = req.getParameter("mcode");
        String date = req.getParameter("date");
        String pcode1 = req.getParameter("pcode1");
        String pcode2 = req.getParameter("pcode2");
        String time = req.getParameter("time");
        String tcode = req.getParameter("tcode");
        String totalPrice = req.getParameter("totalPrice");
        String pcode = pcode1+" "+pcode2;
        BookDTO bookdto = new BookDTO(tcode, hNum, uid, seats, mcode,date,pcode,time, totalPrice);
        SeatService.putBookedData(bookdto);
    }
    
}
