package com.javalec.team.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.NoticeDto;
import com.javalec.team.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> list(Criteria cri);
	public ArrayList<ReviewDto> newList(Criteria cri);
	public void write(HashMap<String, String> param);
	public ReviewDto show(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
    public int getTotal();
    public void upGood(HashMap<String, String> param); //����
    public void insertRate(HashMap<String, String> param);
    public ReviewDto getMcode(HashMap<String, String> param);
    public ReviewDto getRateAvg(HashMap<String, String> param);
    public ReviewDto reviewcheck(HashMap<String, String> param);
    public int  getrcode();
    public ArrayList<ReviewDto> searchMovieTitle(Criteria cri);
    public ArrayList<ReviewDto> searchContent(Criteria cri);
    public ArrayList<ReviewDto> searchMovieTitle1(Criteria cri);
    public ArrayList<ReviewDto> searchContent1(Criteria cri);
    
}
