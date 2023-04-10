package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface BoardService {


	// [회원] ************************************************************* 

   //로그인
   public Map login(Map<String, Object> map);
   // 세션 Id
   public jointempDTO sessionId(jointempDTO dto) throws Exception;

   
   //회원가입
   public int jointemp(jointempDTO jointempDTO) throws Exception;
   // 아이디 중복확인
   public int checkId(jointempDTO dto) throws Exception;
   // 닉네임 중복확인
   public int checkEname(jointempDTO dto) throws Exception;
   
   
   // ID 찾기
   public String findId(jointempDTO dto) throws Exception;   
   // Password 찾기
   public String findPw(jointempDTO jointempDTO) throws Exception;
   // Password 바꾸기
   public int changPw(jointempDTO jointempDTO) throws Exception;
   
   
   //회원관리 처리를 위한 메소드
   public List<jointempDTO> manage() throws Exception;
   //회원관리 페이지처리
   public int getmembercnt() throws Exception;
   //회원관리 페이징
   public List<jointempDTO> manage(paging paging) throws Exception;
   //회원정보 상세조회
   public jointempDTO manageOne(String m_id) throws Exception;
   // 관리자 - 회원정보 수정
   public int userupdate(jointempDTO jointempDTO) throws Exception;
   // 관리자 - 회원정보 삭제
   public int userdelete(String m_id) throws Exception;
   
   // 개인 - 회원정보 변경
   public jointempDTO personal(String m_id) throws Exception;
   // 개인 - 회원정보 수정
   public int perupdate(jointempDTO jointempDTO) throws Exception;
   
   // [게시판] ************************************************************
   
   //공지 게시물 처리를 위한 메소드
   public List<BoardDTO> list() throws Exception;
   //공지 게시판 페이지처리
   public int getlistcnt() throws Exception;
   //공지 게시물 페이징
   public List<BoardDTO> list(paging paging) throws Exception;
   
   
   //인기 게시물 처리를 위한 메소드
   public List<BoardDTO> list_pop() throws Exception;
   //인기 게시판 페이지처리
   public int getpopcnt() throws Exception;
   //인기 게시물 페이징
   public List<BoardDTO> list_pop(paging paging) throws Exception;
   
   
   //메인 게시물 처리를 위한 메소드
   public List<BoardDTO> list_main() throws Exception;
   //메인 게시판 페이지처리
   public int getmaincnt() throws Exception;
   //메인 게시물 페이징
   public List<BoardDTO> list_main(paging paging) throws Exception;
   
   
   //자유 게시물 처리를 위한 메소드
   public List<BoardDTO> list_free() throws Exception;
   //자유 게시판 페이지처리
   public int getfreecnt() throws Exception;
   //자유 게시물 페이징
   public List<BoardDTO> list_free(paging paging) throws Exception;
    
   
   //나의 문의 게시물 처리를 위한 메소드
   public List<BoardDTO> question() throws Exception;
   //나의 문의 페이지처리
   public int getRequestCnt() throws Exception;
   //나의 문의 페이징
   public List<BoardDTO> question(paging paging) throws Exception;
   
   
   //나의 게시물 처리를 위한 메소드
   public List<BoardDTO> list_my(BoardDTO boardDTO) throws Exception;
   //나의 게시판 페이지처리
   public int getmycnt(String m_id) throws Exception;
   //나의 게시물 페이징
   public List<BoardDTO> list_my(paging paging) throws Exception;
   
   
   //포인트 리스트 게시물 처리를 위한 메소드
   public List<BoardDTO> point_list() throws Exception;
   //포인트 리스트 페이지처리
   public int getPointCnt() throws Exception;
   //포인트 리스트 페이징
   public List<BoardDTO> point_list(paging paging) throws Exception;
   //포인트
   public int point(PointDTO PointDTO) throws Exception;
   

   
   // [레지스터]  ***************************************************************
   //선택목록(글읽기)을 위한 메소드
   public BoardDTO detail(int BD_NUM) throws Exception;
   
   // 조회수 증가를 위한 메소드
   public int updateReadCnt(int BD_NUM) throws Exception;
   
   //글쓰기를 위한 메소드
   public int register(BoardDTO boardDTO) throws Exception;
   
   //글수정을 위한 메소드
   public int update(BoardDTO boardDTO) throws Exception;
   
   //글삭제를 위한 메소드
   public int delete(int BD_NUM) throws Exception;
   
   
   
   // 댓글 *********************************************************************
   //댓글 전체 목록
   public List<BoardReply> getDetail(int BD_NUM) throws Exception;
   
   //댓글 쓰기
   public int reply(BoardReply boardReply) throws Exception;
   
   //해당 댓글 읽기(조회)
   public BoardReply detailReply(int COMM_NUM) throws Exception;
   
   //댓글 수정
   public int replyUpdate(BoardReply boardReply) throws Exception;
   
   //댓글 삭제
   public int replyDelete(BoardReply boardReply) throws Exception;
   
   
   
   //코드
   public List<CodeDTO> codeList(CodeDTO CodeDTO) throws Exception;
   
   
   // 마이페이지 ****************************************************************
   public int ptUpdate(jointempDTO jointempDTO) throws Exception;
   public jointempDTO mySelect(jointempDTO jointempDTO) throws Exception;
  
   
}