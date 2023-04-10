package kr.co.dong.board;

public class PointDTO {
	
	private int p_num;
	private String p_cd;
	private String p_name; 
	private String p_tel;
	private String p_date;
	private int p_condition;
	private String m_ename;
	private int p_info_yn;
	private int p_adv_yn;
	private String p_cd_name;
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_cd() {
		return p_cd;
	}
	public void setP_cd(String p_cd) {
		this.p_cd = p_cd;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_tel() {
		return p_tel;
	}
	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getP_condition() {
		return p_condition;
	}
	public void setP_condition(int p_condition) {
		this.p_condition = p_condition;
	}
	public String getM_ename() {
		return m_ename;
	}
	public void setM_ename(String m_ename) {
		this.m_ename = m_ename;
	}
	public int getP_info_yn() {
		return p_info_yn;
	}
	public void setP_info_yn(int p_info_yn) {
		this.p_info_yn = p_info_yn;
	}
	public int getP_adv_yn() {
		return p_adv_yn;
	}
	public void setP_adv_yn(int p_adv_yn) {
		this.p_adv_yn = p_adv_yn;
	}
	public String getP_cd_name() {
		return p_cd_name;
	}
	public void setP_cd_name(String p_cd_name) {
		this.p_cd_name = p_cd_name;
	}
	
	@Override
	public String toString() {
		return "PointDTO [p_num=" + p_num + ", p_cd=" + p_cd + ", p_name=" + p_name + ", p_tel=" + p_tel + ", p_date="
				+ p_date + ", p_condition=" + p_condition + ", m_ename=" + m_ename + ", p_info_yn=" + p_info_yn
				+ ", p_adv_yn=" + p_adv_yn + ", p_cd_name=" + p_cd_name + "]";
	}
	
	
	
}
