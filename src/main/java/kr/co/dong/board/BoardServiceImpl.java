package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

   @Autowired
   BoardDAO dao;
   
   // 회원 *********************************************************************************************************************
   
   //로그인
   @Override
   public Map login(Map<String, Object> map) {
      return dao.login(map);
   } 
   	// 세션
	@Override
	public jointempDTO sessionId(jointempDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.sessionId(dto);
	}



   // 회원가입
   @Override
   public int jointemp(jointempDTO jointempDTO) throws Exception {
      return dao.jointemp(jointempDTO);
   }
   // 아이디 중복 확인
	@Override
	public int checkId(jointempDTO dto) throws Exception {
		int result = dao.checkId(dto);
		return result;
	}
	// 닉네임 중복 확인
	@Override
	public int checkEname(jointempDTO dto) throws Exception {
		int result = dao.checkEname(dto);
		return result;
	}


   
	
    
	// ID 찾기
	@Override
	public String findId(jointempDTO jointempDTO) throws Exception {
		return dao.findId(jointempDTO);
	}
	// Password 찾기
	@Override
	public String findPw(jointempDTO jointempDTO) throws Exception {
		return dao.findPw(jointempDTO);
	}
	// Password 바꾸기
	@Override
	public int changPw(jointempDTO jointempDTO) throws Exception {
		return dao.changPw(jointempDTO);
	}

	
	
	
	
   // 회원 관리
   @Override
   public int getmembercnt() throws Exception {
      return dao.getmembercnt();
   }   
   @Override
   public List<jointempDTO> manage() throws Exception {
      return dao.manage();
   }  
   @Override
   public List<jointempDTO> manage(paging paging) throws Exception {
      return dao.manage(paging);
   }
   
   
   //회원정보 상세조회
   @Override
   public jointempDTO manageOne(String m_id) throws Exception {
	   return dao.manageOne(m_id);
   }
   // 관리자 - 회원정보 수정
   @Override
   public int userupdate(jointempDTO jointempDTO) throws Exception{
	   return dao.userupdate(jointempDTO);
   }
   // 관리자 - 회원정보 삭제
   @Override
   public int userdelete(String m_id) throws Exception{
   	return dao.userdelete(m_id);
   }

   
   	// 개인 - 회원 정보 조회
	@Override
	public jointempDTO personal(String m_id) throws Exception {
		return dao.personal(m_id);
	}
	//개인 - 회원 정보 변경 
	@Override
	public int perupdate(jointempDTO jointempDTO) throws Exception {
		return dao.perupdate(jointempDTO);
	}

   
   
   
   
   // 레지스터  *********************************************************************************************************************
   
   @Override
   public int register(BoardDTO boardDTO) throws Exception {
      return dao.register(boardDTO);
   }
   
   // 디테일
   @Override
   public BoardDTO detail(int BD_NUM) throws Exception {
      return dao.detail(BD_NUM);
   }

   // 업데이트
   @Override
   public int update(BoardDTO boardDTO) throws Exception {
      return dao.update(boardDTO);
   }
   
   // 삭제
   @Override
   public int delete(int BD_NUM) throws Exception {
      return dao.delete(BD_NUM);
   }
   
   // 디테일 조회수 증가
	@Override
	public int updateReadCnt(int BD_NUM) throws Exception {
		return 0;
	}
	

	
   
   
   // 댓글 *********************************************************************************************************************
   
   @Override
   public List<BoardReply> getDetail(int BD_NUM) throws Exception {
      return dao.getDetail(BD_NUM);
   }

   @Override
   public int reply(BoardReply boardReply) throws Exception {
      return dao.reply(boardReply);
   }

   @Override
   public BoardReply detailReply(int COMM_NUM) throws Exception {
      return dao.detailReply(COMM_NUM);
   }

   @Override
   public int replyUpdate(BoardReply boardReply) throws Exception {
      return dao.replyUpdate(boardReply);
   }

   @Override
   public int replyDelete(BoardReply boardReply) throws Exception {
      return dao.replyDelete(boardReply);
   }

   
   
   // ***************************************************************************************************************************
   @Override
   public List<CodeDTO> codeList(CodeDTO CodeDTO) throws Exception {
      return dao.codeList(CodeDTO);
   }

   
  




   // 게시판 ***************************************************************************************************************************
   // 공지
   @Override
   public int getlistcnt() throws Exception {
      return dao.getlistcnt();
   }
   @Override
   public List<BoardDTO> list() throws Exception {
      return dao.list();
   }
   @Override
   public List<BoardDTO> list(paging paging) throws Exception {
      return dao.list(paging);
   }
   
   //인기 게시판
   @Override
   public int getpopcnt() throws Exception {
      return dao.getpopcnt();
   }  
   @Override
   public List<BoardDTO> list_pop() throws Exception {
      return dao.list_pop();
   }

   @Override
   public List<BoardDTO> list_pop(paging paging) throws Exception {
      return dao.list_pop(paging);
   }
   
   
   // 메인
   @Override
   public int getmaincnt() throws Exception {
      return dao.getmaincnt();
   }
   @Override
   public List<BoardDTO> list_main() throws Exception {
      return dao.list_main();
   }
   @Override
   public List<BoardDTO> list_main(paging paging) throws Exception {
      return dao.list_main(paging);
   }
   
   
   // 자유
   @Override
   public int getfreecnt() throws Exception {
      return dao.getfreecnt();
   }
   @Override
   public List<BoardDTO> list_free() throws Exception {
      return dao.list_free();
   }
   @Override
   public List<BoardDTO> list_free(paging paging) throws Exception {
      return dao.list_free(paging);
   }

   
   // 나의 문의
	@Override
	public List<BoardDTO> question() throws Exception {
		return dao.question();
	}
	@Override
	public int getRequestCnt() throws Exception {
		return dao.getRequestCnt();
	}
	@Override
	public List<BoardDTO> question(paging paging) throws Exception {
		return dao.question(paging);
	}

	
	// 나의 게시글
	@Override
	public List<BoardDTO> list_my(BoardDTO boardDTO) throws Exception {
		return dao.list_my(boardDTO);
	}
	@Override
	public int getmycnt(String m_id) throws Exception {
		return dao.getmycnt(m_id);
	}
	@Override
	public List<BoardDTO> list_my(paging paging) throws Exception {
		return dao.list_my(paging);
	}
	
	
	// 포인트 샵 ***************************************************************************************************************************
	@Override
	public List<BoardDTO> point_list() throws Exception {
		return dao.point_list();
	}
	@Override
	public int getPointCnt() throws Exception {
		return dao.getPointCnt();
	}
	@Override
	public List<BoardDTO> point_list(paging paging) throws Exception {
		return dao.point_list(paging);
	}

	@Override
	public int point(PointDTO PointDTO) throws Exception {
		return dao.point(PointDTO);
	}



	// 마이페이지 ***************************************************************************************************************************
	
	@Override
	public int ptUpdate(jointempDTO jointempDTO) throws Exception {
		return dao.ptUpdate(jointempDTO);
	}

	@Override
	public jointempDTO mySelect(jointempDTO jointempDTO) throws Exception {
		return dao.mySelect(jointempDTO);
	}



}