package com.javalec.team.service;

import com.javalec.team.dto.BookDTO;
import org.springframework.ui.Model;

import java.util.ArrayList;

public interface Res_Movie_SeatService {

    //조조 영화 여부 확인
    int findJvalidation(String hNUm, String sTime);

    //예매 내역 DB 등록
    void putBookedData(BookDTO bdto);

    //가격
    ArrayList<Integer> findPriceInfo(int jVali);

    //좌석
    void findAllSeats(String mcode, String date, String time, String tcode, Model model);


}
