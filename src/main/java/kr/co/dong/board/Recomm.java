package kr.co.dong.board;

public class Recomm {
	
	
	private String m_id;
	private int bd_num;
	private int m_recomm;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getBd_num() {
		return bd_num;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	public int getM_recomm() {
		return m_recomm;
	}
	public void setM_recomm(int m_recomm) {
		this.m_recomm = m_recomm;
	}
	
	@Override
	public String toString() {
		return "Recomm [m_id=" + m_id + ", bd_num=" + bd_num + ", m_recomm=" + m_recomm + "]";
	}
	
	
	
}
