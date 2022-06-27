package com.javalec.team.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.FaqDto;

public interface FaqService {
	public ArrayList<FaqDto> list(HashMap<String, String> param);
	public ArrayList<FaqDto> listPaging(Criteria cri);
	public void write(HashMap<String, String> param);
	public FaqDto show(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
//	public ArrayList<FaqDto> search(HashMap<String, String> param);    �����ؾ���
	public int num();
    /* �Խ��� �� ���� */
    public int getTotal();
    public int getfcode();
    public ArrayList<FaqDto> searchTitle(Criteria cri);
    public ArrayList<FaqDto> searchContent(Criteria cri);
    public ArrayList<FaqDto> searchCategory(Criteria cri);
}
