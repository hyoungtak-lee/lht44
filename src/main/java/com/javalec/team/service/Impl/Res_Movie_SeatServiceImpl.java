package com.javalec.team.service.Impl;

import com.javalec.team.dao.Res_Movie_Reserve_Dao;
import com.javalec.team.dto.HtimeDTO;
import com.javalec.team.service.Res_Movie_SeatService;
import com.javalec.team.AppConfig;
import com.javalec.team.dto.BookDTO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;

@Service
public class Res_Movie_SeatServiceImpl implements Res_Movie_SeatService {
    Res_Movie_Reserve_Dao dao;
    AppConfig appConfig = new AppConfig();

    @Override
    public int findJvalidation(String sHall, String sTime) {
        dao = appConfig.dao();
        int num = Integer.parseInt(sHall);
        ArrayList<HtimeDTO> list = dao.jValidation(num,sTime);
        int status = list.get(0).getH_st();
        return status;
    }

    @Override
    public void putBookedData(BookDTO bdto) {
        dao = appConfig.dao();
        dao.insertReservationData(bdto);
    }

    @Override
    public ArrayList<Integer> findPriceInfo(int jva) {
        dao = appConfig.dao();
        return dao.getPrice(jva);
    }

    @Override
    public void findAllSeats(String mcode, String date, String time, String tcode, Model model) {
        dao = appConfig.dao();
        ArrayList<BookDTO> blist = dao.getBookedSeatInfo(mcode,date,time,tcode);
        String bookedSeat = "";
        for(int i =0;i< blist.size();i++){
            bookedSeat += blist.get(i).getSe_code();
        }
        String [] arr = bookedSeat.split(" ");
        ArrayList<String> strlist = new ArrayList<String>();
        for (int i = 0; i < arr.length; i++) {
        	strlist.add(arr[i]);
		}

        model.addAttribute("booked",strlist);
    }
}
