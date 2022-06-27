package com.javalec.team.dao;

import com.javalec.team.dto.*;
import com.javalec.team.util.Constant;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class Res_Movie_Reserve_Dao {
    private JdbcTemplate jdbcTemplate;

    public Res_Movie_Reserve_Dao() {
        jdbcTemplate = Constant.template;
    }



    public ArrayList<MovieDto> listTest() {
        String sql = "select m_code,m_title, m_period from movie";
//        String sql = "select t_name from theather where t_code like '"+Rcode+"%'";
        System.out.println("sql : " + sql);
        return (ArrayList<MovieDto>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(MovieDto.class));
    }
    public ArrayList<MovieDto> getMovieList(){
        String sql = "select m_code,m_title, m_period from movie";
        return (ArrayList<MovieDto>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(MovieDto.class));
    }

    public int DateValidation(){
        String sql = "select sc_code from screen where m_code =1 and h_num=1";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public List<TheaterDTO> getTheaterList(String Rcode){
        String sql = "select t_code, t_name from theather where t_code like '"+Rcode+"%'";
        return (List<TheaterDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(TheaterDTO.class));
    }

    public ArrayList<ScreenDTO> getTheaterNum(String Mcode){
        String sql = "select h_num from screen where m_code="+Mcode;
        return (ArrayList<ScreenDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(ScreenDTO.class));
    }

    public List<HtimeDTO> getTheaterDetail(String Mcode){
        ArrayList<ScreenDTO> TheaterNum = getTheaterNum(Mcode);

        ArrayList<Integer> numlist = new ArrayList<Integer>();
        for(int i=0;i< TheaterNum.size();i++){
            numlist.add(TheaterNum.get(i).getH_num());
        }

        StringBuilder sql = new StringBuilder("select h_num,h_time,h_st from hall_time where h_num="+numlist.get(0));
        for(int i=1;i<numlist.size();i++) {
            sql.append(
                    " union " +
                            "select h_num,h_time,h_st from hall_time where h_num="+numlist.get(i));
        }
        String Determinedsql = sql.toString();
        return (List<HtimeDTO>) jdbcTemplate.query(Determinedsql, new BeanPropertyRowMapper(HtimeDTO.class));
    }

    public ArrayList<HtimeDTO> jValidation(int hall, String time){
        String sql="select * from hall_time where h_num ="+hall+" and h_time = '"+time+"'";
        return (ArrayList<HtimeDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(HtimeDTO.class));
    }

    //선택한 영화의 가격 출력 <- getPcode()
    public ArrayList<Integer> getPrice(int status){
        ArrayList<PriceDTO> pCodeList = getPcode();
        ArrayList<Integer> priceList = new ArrayList<Integer>();
        for(int i = 0;i< pCodeList.size();i++){
            int code = pCodeList.get(i).getP_code();
            int pcode = (code/100)%100;
            if(status != pcode){
                priceList.add(pCodeList.get(i).getP_price());
            }
        }
        return priceList;
    }
    public ArrayList<PriceDTO> getPcode(){
        String sql ="select * from price";
        return (ArrayList<PriceDTO>) jdbcTemplate.query(sql,new BeanPropertyRowMapper(PriceDTO.class));
    }

    //화면에 좌석 출력하기 위한 로직
    public ArrayList<SeatDTO> getSeatInfo(String sHall){
        String sql = "select h_num, se_code from seat where h_num="+sHall;
        return (ArrayList<SeatDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(SeatDTO.class));
    }
    //예매 완료 좌석 미리 선택되게
    public ArrayList<BookDTO> getBookedSeatInfo(String mcode, String date, String time,String tcode){
        String sql = "select distinct se_code from book where m_code= '"+mcode+"' and b_date= '"+date+"' and h_time='"+time+"' and t_code="+tcode;
        System.out.println("@@@###DAO@@@###");
        System.out.println(sql);
        System.out.println("================");
        return (ArrayList<BookDTO>) jdbcTemplate.query(sql, new BeanPropertyRowMapper(BookDTO.class));
    }



    //pcode 찾기
    public int findPcodeByPrice(String price){
//   	public int findPcodeByPrice(int price){
        String sql = "select p_code from price where p_price="+price;
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }


    public void insertReservationData(BookDTO bdto) {
        int hnum = Integer.parseInt(bdto.getH_num());
        String str = bdto.getP_code();
        String [] parr = str.split(" "); //bdto.getP_code() : NAN 14000
        for(int i=0; i<parr.length;i++) {
            if(parr[i].charAt(0)>='0'&& parr[i].charAt(0)<='9') {
                String pcodeResult = Integer.toString(findPcodeByPrice(parr[i]));
                String sql = "insert into book(b_code, b_yn, t_code, h_code, se_code, u_id, m_code, b_date, p_code, h_time, total_price) " +
                        "values(book_seq.nextval, '"+1+"',"+bdto.getT_code()+", "+hnum+", '"+bdto.getSe_code()+"', '"+bdto.getU_id()+"', '"+bdto.getM_code()+"', '"+bdto.getB_date()+"', '"+ pcodeResult+"','"+ bdto.getH_time()+"','"+bdto.getTotalPrice()+"')";
                jdbcTemplate.update(sql);
            }
        }
    }
    
//insert test
    public void write(int num) {
        String sql="insert into price(p_code, p_price) values(1,+"+num+")";
        jdbcTemplate.update(sql);
    }


}
