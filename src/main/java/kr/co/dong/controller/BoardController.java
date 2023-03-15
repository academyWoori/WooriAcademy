package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;

import kr.co.dong.HomeController;
import kr.co.dong.board.BoardDTO;
import kr.co.dong.board.BoardReply;
import kr.co.dong.board.BoardService;
import kr.co.dong.board.CodeDTO;
import kr.co.dong.board.jointempDTO;
import kr.co.dong.board.paging;


@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
//	로그인 폼으로 가는 매핑 board/login -> login(.jsp)
	@RequestMapping(value="board/login", method = RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
//	로그인 폼으로 가는 매핑 board/login -> login(.jsp)
	@GetMapping(value="board/logOut")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
//	로그인 처리하기 (DAO)  : 성공하면 redirect:/ (또는 home.jsp)
//	                           세션부여함.
	@RequestMapping(value="board/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(map);
		// 서비스 호출
		Map user = service.login(map);
		
		if(user == null) {  // 로그인 실패
			
			return "redirect:login";
		}else {   // 로그인 성공
			// 세션 부여
			session.setAttribute("user", user);
			return "redirect:/";
		}		
	}
	
	@RequestMapping(value="board/list", method = RequestMethod.GET)
	public ModelAndView list1(@RequestParam(value="page", required=false, defaultValue="1")int page,
							 @RequestParam(value="range", required=false, defaultValue="1")int range) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		paging paging = new paging();
		
		int getListCnt = service.getlistcnt();
		paging.pageInfo(page, range, getListCnt);
		
		mav.addObject("pagination", paging);
		List<BoardDTO> list = service.list(paging);
		mav.addObject("list", list);
		mav.setViewName("list");
		
		return mav;	
	}
	
	
	@RequestMapping(value="board/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardDTO board = service.detail(bno);
		model.addAttribute("board", board);
		//댓글목록
		List<BoardReply> list = service.getDetail(bno);
		model.addAttribute("list", list);
		return "detail";
	}
	
//	글쓰기폼
	@RequestMapping(value="board/register", method = RequestMethod.GET)
	public String register() {
		
		return "register";
	}
//	글쓰기 저장
	@RequestMapping(value="board/register", method = RequestMethod.POST)
	public String register(BoardDTO boardDTO, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("내용 : " + boardDTO);
		
		int r = service.register(boardDTO);
		
		return "redirect:list";
	}
	
	
//	글 수정 폼(기존데이터 전송- 글읽기)
	@RequestMapping(value="board/update", method = RequestMethod.GET)
	public String update(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardDTO board = service.detail(bno);
		model.addAttribute("board", board);		
		return "update";
	}	
//	글 수정 저장
	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public String update(BoardDTO boardDTO, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.update(boardDTO);
		// 수정에 성공하면 목록보기로 이동
		if (r > 0) {
			rttr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:list";
		}
		// 수정에 실패하면 수정보기 화면으로 이동
		return "redirect:update?bno=" + boardDTO.getBno();
	}
	
	@RequestMapping(value="board/delete",method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		int r = service.delete(bno);
		
		if(r > 0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:list";
		}
		return "redirect:detail?bno=" + bno;
	}
	
	@GetMapping(value="board/reply")
	public String reply() {
		return "reply";
	}
	
	@PostMapping(value="board/reply")
	public String reply(BoardReply boardReply) throws Exception {
		int r = service.reply(boardReply);
		if(r>0) {
			return "redirect:detail?bno=" + boardReply.getBno();
		}
		return "reply";
	}

	@GetMapping(value="board/replyupdate")
	public String replyUpdate(@RequestParam("reno")int reno, Model model) throws Exception {
		BoardReply boardReply = service.detailReply(reno);
		model.addAttribute("boardReply", boardReply);
		return "replyupdate";
	}
	
	@PostMapping(value="board/replyupdate")
	public String replyUpdate(BoardReply boardReply) throws Exception {
		logger.info("!!!!!!!!!!!!!");
		int r = service.replyUpdate(boardReply);
		if(r>0) {
			return "redirect:detail?bno="+boardReply.getBno();
		}
		return "replyupdate";
	}
	
	@RequestMapping(value="board/replyDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public String replyDelete(BoardReply boardReply) throws Exception {
		logger.info("!!!!!!!!!!!!!"+boardReply.getBno());
		int r = service.replyDelete(boardReply);
		if(r>0) {
			return "redirect:detail?bno="+boardReply.getBno();
		}
		return "replyupdate";
	}
/*
	// ajax 매핑과 메소드를 구현
	// json처리를 위한 라이브러리가 필요함 => jackson-databind, jackson-core
	// result type도 json 타입이므로, map으로 보내줘야함. String 안됨
	@ResponseBody //ajax는 꼭 작성해줘야함
	@RequestMapping(value="board/test", method = RequestMethod.POST)
	public Map<String,Object> test(@RequestParam("msg") String msg) {
		logger.info("msg : "+msg);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("status","OK");
		return result;
	}
	*/
	//ajax 댓글에 대한 매핑과 메소드를 구현(모델에 싣지 않고 그대로 return)
	@ResponseBody
	@RequestMapping(value="board/replylist", method = RequestMethod.POST)
	public List<BoardReply> replylist(@RequestParam("bno")int bno) throws Exception {
		return service.getDetail(bno);
	}
	
	//ajax 댓글 쓰기
	@ResponseBody
	@RequestMapping(value="board/reply2", method = RequestMethod.POST)
	public int reply2(BoardReply boardReply) throws Exception {
		return service.reply(boardReply);
	}
	
	//ajax 댓글 수정
	@ResponseBody
	@RequestMapping(value="board/replyupdate2", method = RequestMethod.POST)
	public int replyupdate2(BoardReply boardReply) throws Exception {
		return service.replyUpdate(boardReply);
	}
	
	//ajax 댓글 삭제
	@ResponseBody
	@RequestMapping(value="board/replydelete2", method = RequestMethod.POST)
	public int replydelete2(BoardReply boardReply) throws Exception {
		return service.replyDelete(boardReply);
	}
	
//	회원가입폼
	@RequestMapping(value="board/join", method = RequestMethod.GET)
	public String join() {
		
		return "join";
	}
//  회원가입 저장
  @RequestMapping(value="board/join", method = RequestMethod.POST)
  public String join(jointempDTO jointempDTO, HttpServletRequest request)throws Exception {
     request.setCharacterEncoding("utf-8");
     int r = service.jointemp(jointempDTO);
     
     return "redirect:/";
  }
	
	@RequestMapping(value="board/blog", method = RequestMethod.GET)
	public String blog() {
		
		return "blog";
	}
	
	@RequestMapping(value="board/point", method = RequestMethod.GET)
	public String point() {
		
		return "point";
	}
	
	@RequestMapping(value="board/productord", method = RequestMethod.GET)
	public String productord() {
		
		return "productord";
	}
	
	@RequestMapping(value="board/T_List", method = RequestMethod.GET)
	public String T_List() {
		
		return "T_List";
	}
	
	@RequestMapping(value="board/T_oneSelect1", method = RequestMethod.GET)
	public String T_oneSelect1() {
		
		return "T_oneSelect1";
	}
	
	@RequestMapping(value="board/T_twoSelect1", method = RequestMethod.GET)
	public String T_twoSelect1() {
		
		return "T_twoSelect1";
	}
	
}






