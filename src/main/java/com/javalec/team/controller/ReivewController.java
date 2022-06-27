package com.javalec.team.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.javalec.team.dto.Criteria;
import com.javalec.team.dto.GoodDto;
import com.javalec.team.dto.MovieDto;
import com.javalec.team.dto.NoticeDto;
import com.javalec.team.dto.ReviewDto;
import com.javalec.team.dto.pageMakerDto;
import com.javalec.team.service.GoodService;
import com.javalec.team.service.Reg_movie_Service;
import com.javalec.team.service.ReviewService;
@Controller
public class ReivewController {
	@Autowired
	HttpSession session;
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private GoodService goodservice;
	
	@Autowired
	private Reg_movie_Service movieService;
	
	@RequestMapping("reviewList")
	public String list(Model model, Criteria cri) {
		System.out.println("@@@### ReivewController list() start");
		
		model.addAttribute("u_auth", session.getAttribute("u_auth"));
		
		model.addAttribute("list", service.list(cri));
		
		ArrayList<ReviewDto> dtos = service.list(cri);
		HashMap<String, String> map = new HashMap<String, String>();
		//System.out.println(dtos.get(0).getM_code());
		map.put("m_code", dtos.get(0).getM_code());
		
		//System.out.println(movieService.show(map));
		
		MovieDto dto = movieService.show(map);
		model.addAttribute("movie", dto);
		
		
		int total = service.getTotal();
		
		pageMakerDto pageMake = new pageMakerDto(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		System.out.println("@@@### ReivewController list() end");
		
		return "/review/list";
	}
	
	@RequestMapping("/reviewWrite_view")
	public String write_view(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		System.out.println("@@@### write_view()");
		
		System.out.println("占쏙옙占쏙옙占쌘듸옙==>"+request.getParameter("b_code"));
		model.addAttribute("book", request.getParameter("b_code"));
		model.addAttribute("m_code", request.getParameter("m_code"));
		System.out.println("m_code==>"+request.getParameter("m_code"));
		System.out.println("id==>"+session.getAttribute("u_id"));
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id", (String) session.getAttribute("u_id"));
		map.put("m_code", request.getParameter("m_code"));
		
		/*
		 * ReviewDto dto = service.getMcode(map); model.addAttribute("m_code", dto);
		 *
		 * map.put("m_code", dto.getM_code());
		 */
		
		MovieDto m_title = movieService.show(map);
		model.addAttribute("m_title", m_title);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		if (service.reviewcheck(map) == null) {
			System.out.println("占쏙옙占썰쓴占쏙옙占쏙옙占쏙옙");
		} else {
			System.out.println("占쏙옙占썰쓴占쏙옙占쏙옙占쏙옙 start");
			
			out.println("<script>alert('이미 리뷰를 쓴 영화입니다.');history.back();</script>");
			out.flush();
			
			System.out.println("占쏙옙占썰쓴占쏙옙占쏙옙占쏙옙 end");
			
		}
		return "review/write";
	}
	
	@RequestMapping("/reviewWrite")
	public String write(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController write() start");
		
		System.out.println("r_name=====>"+param.get("r_name"));
		System.out.println("u_id=====>"+param.get("u_id"));
		System.out.println("r_rate=====>"+param.get("r_rate"));
		System.out.println("r_good=====>"+param.get("r_good"));
		System.out.println("b_code=====>"+param.get("b_code"));
		System.out.println("m_code=====>"+param.get("m_code"));
		System.out.println("m_title=====>"+param.get("m_title"));
		
		int num = service.getrcode();
		num+=1;
		param.put("r_code",Integer.toString(num));
		System.out.println("r_code=====>"+param.get("r_code"));
		service.write(param);
		
		
		
		/*
		 * ReviewDto dto = service.getMcode(param); //占쏙옙占쏙옙 占쏙옙占싱븝옙占쏙옙 占쏙옙화 占쌘듸옙
		 * 占쏙옙占쏙옙占쏙옙 System.out.println("m_code==>"+dto.getM_code()); HashMap<String,
		 * String> map = new HashMap<String, String>(); map.put("m_code",
		 * dto.getM_code()); //占쏙옙화占쌘듸옙 map占쏙옙 占쏙옙占쏙옙
		 * System.out.println("map m_code==>"+map.get("m_code"));
		 */
//		HashMap<String, String> map = new HashMap<String, String>();
		ReviewDto rateDto = service.getRateAvg(param);  //占쏙옙화占쌘듸옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쌔당영화占쏙옙 占쏙옙占쏙옙 占쏙옙瀾占�
		param.put("r_rate", Integer.toString(rateDto.getR_rate())); //占쏙옙占쏙옙 map占쏙옙 占쏙옙占쏙옙
		
		service.insertRate(param); //占쏙옙화 占쏙옙占싱븝옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트占쏙옙
		
		System.out.println("@@@### ReivewController write() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewDelete")
	public String delete(@RequestParam HashMap<String, String> param) {
		System.out.println("@@@### ReivewController delete() start");
		
		service.delete(param);
		
		System.out.println("@@@### ReivewController delete() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewModify_view")
	public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### modify_view()");
		
		ReviewDto dto = service.show(param);
		model.addAttribute("show", dto);
		
		return "/review/modify";
	}
	
	@RequestMapping(value = "/reviewModify")
	public String modify(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### ReivewController modify() start");
		
		service.modify(param);
		
		System.out.println("@@@### ReivewController modify() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewGood")
	public String good(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws IOException {
		System.out.println("@@@### ReivewController good() start");
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		//추천수를 올리기전에 추천 테이블 만들고 거기에 유저아이디, 리뷰코드, 추천코드, 추천yn만든다
		GoodDto dto = goodservice.get(param);
		
		if (session.getAttribute("u_id") == null) {
			out.println("<script>alert('비회원은 추천할 수 없습니다.');history.back();</script>");
			out.flush();
			
		} else {
			if (goodservice.get(param) == null) {
				System.out.println("추천한적 없음 start");
				goodservice.insert(param);
				service.upGood(param);
				System.out.println("추천한적 없음 end");
			} else {
				System.out.println("추천한적 있음 start");
				
				out.println("<script>alert('이미 추천한 글입니다.');history.back();</script>");
				out.flush();
				
			}
		}
		
		
		System.out.println("@@@### ReivewController good() end");
		
		return "redirect:reviewList";
	}
	
	@RequestMapping("/reviewSearch")
	public String search(HttpServletRequest request, Model model, Criteria cri) {
		System.out.println("@@@### ReivewController search() start");
		
		request.getParameter("kind");
		if (request.getParameter("kind").equals("영화제목")) {
			ArrayList<ReviewDto> dtos = service.searchMovieTitle(cri);
			model.addAttribute("list", dtos);
			
//			Assertions.assertThat("kind").isSameAs("");
		} else {
			ArrayList<ReviewDto> dtos = service.searchContent(cri);
			model.addAttribute("list", dtos);
		}
		
		int total = service.getTotal();
		
		pageMakerDto pageMake = new pageMakerDto(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		System.out.println("@@@### ReivewController search() end");
		
		return "/review/list";
	}
	
}