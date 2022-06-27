package com.javalec.team.dto;

public class Criteria {
	/* 현재 페이지 */
	private int pageNum;
	
	/* 한 페이지 당 보여질 게시물 갯수 */
	private int amount;
	
	private String q_email;
	private String title;
	private String m_code;
	
	public Criteria() {
		this(1, 10, null, null, null);
	}
	
	

	public Criteria(int pageNum, int amount, String q_email, String title, String m_code) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.q_email = q_email;
		this.title = title;
		this.m_code = m_code;
	}



	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getQ_email() {
		return q_email;
	}

	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", q_email=" + q_email + ", title=" + title
				+ ", m_code=" + m_code + "]";
	}



	
}