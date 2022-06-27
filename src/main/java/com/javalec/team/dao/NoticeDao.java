package com.javalec.team.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.NoticeDto;

public interface NoticeDao {
	public ArrayList<NoticeDto> list(HashMap<String, String> param);
	public ArrayList<NoticeDto> listPaging(Criteria cri);
	public void write(HashMap<String, String> param);
	public NoticeDto show(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void upView(HashMap<String, String> param);
	public int num();
    /* �Խ��� �� ���� */
    public int getTotal();
    public int getncode();
    public ArrayList<NoticeDto> searchTitle(Criteria cri);
    public ArrayList<NoticeDto> searchContent(Criteria cri);
}
