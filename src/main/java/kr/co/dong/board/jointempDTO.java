package kr.co.dong.board;

public class jointempDTO {
   private String m_id;
   private String m_name; 
   private String m_ename; 
   private String m_pw;
   private String m_tel;
   private String m_email;
   private String m_birth;
   private int m_gender;
   private int m_info_yn;
   private int m_adv_yn;
   
   public String getM_id() {
      return m_id;
   }
   public void setM_id(String m_id) {
      this.m_id = m_id;
   }
   public String getM_name() {
      return m_name;
   }
   public void setM_name(String m_name) {
      this.m_name = m_name;
   }
   public String getM_ename() {
      return m_ename;
   }
   public void setM_ename(String m_ename) {
      this.m_ename = m_ename;
   }
   public String getM_pw() {
      return m_pw;
   }
   public void setM_pw(String m_pw) {
      this.m_pw = m_pw;
   }
   public String getM_tel() {
      return m_tel;
   }
   public void setM_tel(String m_tel) {
      this.m_tel = m_tel;
   }
   public String getM_email() {
      return m_email;
   }
   public void setM_email(String m_email) {
      this.m_email = m_email;
   }
   public String getM_birth() {
      return m_birth;
   }
   public void setM_birth(String m_birth) {
      this.m_birth = m_birth;
   }
   public int getM_gender() {
      return m_gender;
   }
   public void setM_gender(int m_gender) {
      this.m_gender = m_gender;
   }
   public int getM_info_yn() {
      return m_info_yn;
   }
   public void setM_info_yn(int m_info_yn) {
      this.m_info_yn = m_info_yn;
   }
   public int getM_adv_yn() {
      return m_adv_yn;
   }
   public void setM_adv_yn(int m_adv_yn) {
      this.m_adv_yn = m_adv_yn;
   }
   @Override
   public String toString() {
      return "jointempDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_ename=" + m_ename + ", m_pw=" + m_pw
            + ", m_tel=" + m_tel + ", m_email=" + m_email + ", m_birth=" + m_birth + ", m_gender=" + m_gender
            + ", m_info_yn=" + m_info_yn + ", m_adv_yn=" + m_adv_yn + "]";
   }
   
   
   
}