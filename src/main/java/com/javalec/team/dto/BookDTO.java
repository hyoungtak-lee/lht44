package com.javalec.team.dto;


public class BookDTO {
    int b_code;
	String b_yn;
	String t_code;
//    int sc_code;
	/*------------*/
    int h_code;
    String u_id;
    String se_code;
	String m_code;
	//	Date b_date;
	String b_date;
	String p_code;
	String h_time;
	String h_num;
	String totalPrice;
	

	public BookDTO() {
	}

	public BookDTO(String t_code, String h_num, String u_id, String se_code, String m_code, String b_date, String p_code, String h_time, String totalPrice) {
		this.t_code = t_code;
		this.h_num =h_num;
		this.u_id = u_id;
		this.se_code = se_code;
		this.m_code = m_code;
		this.b_date = b_date;
		this.p_code = p_code;
		this.h_time = h_time;
		this.totalPrice = totalPrice;
	}
	
	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getH_num() {
		return h_num;
	}

	public void setH_num(String h_num) {
		this.h_num = h_num;
	}

	public int getB_code() {
		return b_code;
	}

	public void setB_code(int b_code) {
		this.b_code = b_code;
	}

	public String getB_yn() {
		return b_yn;
	}

	public void setB_yn(String b_yn) {
		this.b_yn = b_yn;
	}


	public int getH_code() {
		return h_code;
	}

	public void setH_code(int h_code) {
		this.h_code = h_code;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getSe_code() {
		return se_code;
	}

	public void setSe_code(String se_code) {
		this.se_code = se_code;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getH_time() {
		return h_time;
	}

	public void setH_time(String h_time) {
		this.h_time = h_time;
	}

}
