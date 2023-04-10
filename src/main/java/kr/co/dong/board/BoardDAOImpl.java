package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //세션호출하기 위함
public class BoardDAOImpl implements BoardDAO {
   @Autowired
   private SqlSession sqlsession;
   private static final String namespace = "kr.co.dong.boardMapper";
   
   
   // 회원 *********************************************************************************************************************
  
   // 로그인
   @Override
   public Map login(Map<String, Object> map) {
      return sqlsession.selectOne(namespace + ".login", map);
   }
   	// 세션
	@Override
	public jointempDTO sessionId(jointempDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".sessionId",dto);
	}
   
   
   // 회원 가입
   @Override
   public int jointemp(jointempDTO jointempDTO) throws Exception {
      return sqlsession.insert(namespace+".jointemp", jointempDTO);
   }
   // 아이디 중복확인
	@Override
	public int checkId(jointempDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkId", dto);
	}
	// 닉네임 중복확인
	@Override
	public int checkEname(jointempDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".checkEname", dto);
	}
	
   
   
   // ID 찾기
	@Override
	public String findId(jointempDTO jointempDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".findId", jointempDTO);
	}	
	// Password 찾기
	@Override
	public String findPw(jointempDTO jointempDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".findPw", jointempDTO);
	}
	// Password 바꾸기
	@Override
	public int changPw(jointempDTO jointempDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".changPw", jointempDTO);
	}


   
   // 회원 관리
   @Override
   public List<jointempDTO> manage() throws Exception {
      return sqlsession.selectList(namespace + ".manage");
   }
   @Override
   public int getmembercnt() throws Exception {
      return sqlsession.selectOne(namespace+".getmembercnt");
   }
   @Override
   public List<jointempDTO> manage(paging paging) throws Exception {
      return sqlsession.selectList(namespace + ".manage", paging);
   }
   
   // 회원 상세정보
	@Override
	public jointempDTO manageOne(String m_id) throws Exception {
		 return sqlsession.selectOne(namespace+".manageOne",m_id);
	}
	// 관리자 - 회원정보 수정
	@Override
	public int userupdate(jointempDTO jointempDTO) throws Exception {
		return sqlsession.update(namespace+".userupdate",jointempDTO);
	}
	// 관리자 - 회원정보 삭제
	@Override
	public int userdelete(String m_id) throws Exception {
		return sqlsession.update(namespace+".userdelete",m_id);
	}
	
	//개인 - 회원정보 변경
	@Override
	public jointempDTO personal(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".personal",m_id);
	}
	
	// 개인 - 회원정보 수정
	@Override
	public int perupdate(jointempDTO jointempDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace+".perupdate",jointempDTO);
	}
	
   
   
   
   // 게시판 *********************************************************************************************************************
   
	//공지
   @Override
   public int getlistcnt() throws Exception {
      return sqlsession.selectOne(namespace+".getlistcnt");
   }
   @Override
   public List<BoardDTO> list() throws Exception {
      return sqlsession.selectList(namespace + ".list");
   }
   @Override
   public List<BoardDTO> list(paging paging) throws Exception {
      return sqlsession.selectList(namespace + ".list", paging);
   }
   
   
   //인기
   @Override
   public int getpopcnt() throws Exception {
      return sqlsession.selectOne(namespace+".getpopcnt");
   }
   @Override
   public List<BoardDTO> list_pop() throws Exception {
      return sqlsession.selectList(namespace + ".list_pop");
   }
   @Override
   public List<BoardDTO> list_pop(paging paging) throws Exception {
      return sqlsession.selectList(namespace + ".list_pop",paging);
   }
   
   
   //메인
   @Override
   public int getmaincnt() throws Exception {
      return sqlsession.selectOne(namespace+".getmaincnt");
   }
   @Override
   public List<BoardDTO> list_main() throws Exception {
      return sqlsession.selectList(namespace + ".list_main");
   }
   @Override
   public List<BoardDTO> list_main(paging paging) throws Exception {
      return sqlsession.selectList(namespace + ".list_main", paging);
   }

   
   //자유
   @Override
   public int getfreecnt() throws Exception {
      return sqlsession.selectOne(namespace+".getfreecnt");
   }
   @Override
   public List<BoardDTO> list_free() throws Exception {
      return sqlsession.selectList(namespace + ".list_free");
   }
   @Override
   public List<BoardDTO> list_free(paging paging) throws Exception {
      return sqlsession.selectList(namespace + ".list_free", paging);
   }
   
   
   // 나의 문의
   @Override
   public List<BoardDTO> question() throws Exception {
   	return sqlsession.selectList(namespace + ".question");
   }
   @Override
   public int getRequestCnt() throws Exception {
   	return sqlsession.selectOne(namespace+".getRequestCnt");
   }
   @Override
   public List<BoardDTO> question(paging paging) throws Exception {
   	return sqlsession.selectList(namespace + ".question", paging);
   }
   
   
   // 내 게시물
	@Override
	public List<BoardDTO> list_my(BoardDTO boardDTO) throws Exception {
		return sqlsession.selectList(namespace + ".list_my", boardDTO);
	}

	@Override
	public int getmycnt(String m_id) throws Exception {
		return sqlsession.selectOne(namespace+".getmycnt", m_id);
	}

	@Override
	public List<BoardDTO> list_my(paging paging) throws Exception {
		return sqlsession.selectList(namespace + ".list_my", paging);
	}
   
   
   // 레지스터 *********************************************************************************************************************

   @Override
   public int register(BoardDTO boardDTO) throws Exception {
      return sqlsession.insert(namespace+".register", boardDTO);
   }
   
   // 디테일
   @Override
   public BoardDTO detail(int BD_NUM) throws Exception {
      return sqlsession.selectOne(namespace + ".detail", BD_NUM);
   }
   
   // 업데이트
   @Override
   public int update(BoardDTO boardDTO) throws Exception {
      return sqlsession.update(namespace+".update", boardDTO);
   }
   
   // 삭제
   @Override
   public int delete(int BD_NUM) throws Exception {
      return sqlsession.update(namespace+".delete", BD_NUM);
   }
   
   // 게시판 조회수
   @Override
   public int updateReadCnt(int BD_NUM) throws Exception {
      return sqlsession.update(namespace+".updateReadCnt", BD_NUM);
   }

   
   
   
   
   // 댓글 *********************************************************************************************************************
   
   @Override
   public List<BoardReply> getDetail(int BD_NUM) throws Exception {
      return sqlsession.selectList(namespace + ".detail1", BD_NUM);
   }
   
   @Override
   public int reply(BoardReply boardReply) throws Exception {
      return sqlsession.insert(namespace+".reply", boardReply);
   }

   @Override
   public BoardReply detailReply(int COMM_NUM) throws Exception {
      return sqlsession.selectOne(namespace + ".detailReply", COMM_NUM);
   }

   @Override
   public int replyUpdate(BoardReply boardReply) throws Exception {
      return sqlsession.update(namespace+".replyUpdate", boardReply);
   }

   @Override
   public int replyDelete(BoardReply boardReply) throws Exception {
      return sqlsession.delete(namespace+".replyDelete", boardReply);
   }

   
   
   // *****************************************************************************************************************************
   
   @Override
   public List<CodeDTO> codeList(CodeDTO CodeDTO) throws Exception {
      return sqlsession.selectList(namespace+".codeList", CodeDTO);
   }

  


   // 포인트 샵 *********************************************************************************************************************

   
	@Override
	public List<BoardDTO> point_list() throws Exception {
		return sqlsession.selectList(namespace + ".point_list");
	}
		
	@Override
	public int getPointCnt() throws Exception {
		return sqlsession.selectOne(namespace+".getPointCnt");
	}
		
	@Override
	public List<BoardDTO> point_list(paging paging) throws Exception {
		return sqlsession.selectList(namespace + ".point_list", paging);
	}


	@Override
	public int point(PointDTO PointDTO) throws Exception {
		return sqlsession.insert(namespace+".point", PointDTO);
	}

	
	
	
	
	
	// 마이페이지 *********************************************************************************************************************

	// 마이페이지 조회
	@Override
	public jointempDTO mySelect(jointempDTO jointempDTO) throws Exception {
		return sqlsession.selectOne(namespace + ".mySelect", jointempDTO);
	}   

	// 출석체크 포인트 업데이트
	@Override
	public int ptUpdate(jointempDTO jointempDTO) throws Exception {
		return sqlsession.update(namespace + ".ptUpdate", jointempDTO);
	}





   



   

   

   

}