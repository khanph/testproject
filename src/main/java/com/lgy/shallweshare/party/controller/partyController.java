package com.lgy.shallweshare.party.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.shallweshare.party.dto.ApplicationDto;
import com.lgy.shallweshare.party.dto.Criteria;
import com.lgy.shallweshare.party.dto.PageDTO;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.dto.Party_boardUsersDto;
import com.lgy.shallweshare.party.service.PartyService;
import com.lgy.shallweshare.party.service.Party_BoardService;
import com.lgy.shallweshare.users.dto.usersDto;
import com.lgy.shallweshare.users.service.usersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class partyController {
	@Autowired
	private PartyService pService;

	@Autowired
	private usersService userService;
	
	@Autowired 
	private Party_BoardService p_boardService;
	
	
//	=============== 파티 가입 후 페이지 ===============
	@RequestMapping("shop/party_page_joined")
	public String party_page_joined(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: party_page_joined");
		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		// 파티장 정보 가져오기
		usersDto master = userService.getUserInfo(party.getU_id());
		model.addAttribute("master", master);

		// 참여자 정보 가져오기
		ArrayList<ApplicationDto> a_list = pService.getParticipantList(param);
		ArrayList<usersDto> participant_list = new ArrayList<usersDto>();
		for (int i = 0; i < a_list.size(); i++) {
			participant_list.add(userService.getUserInfo(a_list.get(i).getU_id()));
			log.info(participant_list.get(i).getU_nickname());
		}
		model.addAttribute("list", participant_list);

		log.info("@# Controller: party_page ==>" + party);
		
		//파티 게시판 가져오기
		ArrayList<Party_boardUsersDto> chatList = p_boardService.getChattingList(param);
		model.addAttribute("chatList", chatList);
		
		return "shop/party_page_joined";
	}
	
//	=============== 파티 생성 페이지 ===============
	@RequestMapping("shop/party_create")
	public String partyCreate(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: party_create");
		
		return "shop/party_create";
	}
	
//	=============== 파티 생성 메소드 ===============
	@RequestMapping("shop/party_createProcess")
	public String partyCreateProcess(@RequestParam HashMap<String, String> param, Model model, HttpSession session) {
		log.info("@# Controller: party_createProcess");

		
		usersDto dto =(usersDto) session.getAttribute("user");
		log.info("@# Controller: dto=="+dto);
		
		param.put("u_id", String.valueOf(dto.getU_id()));
		log.info("@# Controller: param=="+param);
		
		pService.createParty(param);
		return "redirect:list";
	}

//	=============== 채팅 입력 메소드 ===============
	@RequestMapping("shop/insertChat")
	public String insertChat (@RequestParam HashMap<String, String> param) {
		log.info("@# Controller: insertChat");
		p_boardService.insertChat(param);
		return "redirect:party_page_joined?p_id="+param.get("p_id");
	}
	
	
//	=============== 신청 페이지 ===============
	@RequestMapping("shop/application")
	public String application(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: application");
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		log.info("@# Controller: application ==>" + party);
		return "shop/application";
	}

//	=============== 신청 진행 ===============
	@RequestMapping("shop/application_process")
	public String application_process(@RequestParam HashMap<String, String> param) {

		log.info("@# Controller: application_process");
		pService.application_process(param);
		
		if(param.get("a_payment").equals("무통장입금")) {
			return "redirect:application_complete_bank?p_id="+param.get("p_id");
		}else {
			return "redirect:application_complete_kakao";
		}
	}

//	=============== 신청 완료 페이지(무통장 입금) ===============
	@RequestMapping("shop/application_complete_bank")
	public String application_complete(@RequestParam HashMap<String, String> param,Model model) {
		log.info("@# Controller: application_complete_bank");
		
		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);
		
		// 파티장 정보 가져오기
		usersDto master = userService.getUserInfo(party.getU_id());
		model.addAttribute("master", master);
		return "shop/application_complete_bank";
	}

//	=============== 신청 완료 페이지(카카오) ===============
	@RequestMapping("shop/application_complete_kakao")
	public String application_complete_kakao(@RequestParam HashMap<String, String> param) {
		
		log.info("@# Controller: application_complete_kakao");
		return "shop/application_complete_kakao";
	}
	
	
//	파티 삭제
	@RequestMapping("shop/party_delete")
	public String party_delete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr,HttpSession session) {
		log.info("@# delete");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("Amount", cri.getAmount());
		rttr.addAttribute("u_id", param.get("u_id"));
		log.info("@# u_id==="+param.get("u_id"));
		
		log.info("@# dto==="+cri.getPageNum());
		log.info("@#@#  param==>"+param);
		pService.party_delete(param);
		
		return "redirect:list";
	}
	
//	파티 수정
	
	@RequestMapping("shop/party_modify")
	public String party_modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr,HttpSession session) {
		log.info("party_modify   param==="+param);
		log.info("@#@#@#@#@# party_modify");
		return "shop/party_modify";
	}
	@RequestMapping("shop/party_modifyCheck")
	public String party_modifyCheck(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr,HttpSession session) {
		log.info("@# modify");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("Amount", cri.getAmount());
		rttr.addAttribute("p_id", param.get("p_id"));
		usersDto dto =(usersDto) session.getAttribute("user");
		log.info("@# dto==="+dto);
		
		
		int now_id=dto.getU_id();
		log.info("@# now_id=="+now_id);
		
		int u_id=Integer.parseInt(param.get("u_id"));
		log.info("@# u_id=="+u_id);
		
		if (now_id==u_id) {
			log.info("@# modify 성공");
			pService.party_modify(param);
			return "redirect:list";
		}else {
			log.info("@# modify 실패");
			rttr.addFlashAttribute("failed", true);
			log.info("@# modify param==>"+param);
			return "redirect:party_page";
		}
	}
	
	
//	리스트페이징
	@RequestMapping("shop/list")
	public String party_list(@RequestParam HashMap<String, String> param,HttpServletResponse response,Criteria cri, Model model
							,RedirectAttributes rttr,HttpSession session) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
//		int u_id=Integer.parseInt(session.getAttribute("u_id").toString());
//		log.info("@@@@@@####### u_id==="+u_id);
//		usersDto dto=userService.getUserInfo(u_id);
//		log.info("@@@@@@####### dto==="+dto);
		
		
		log.info("@@@@@@####### list");
		log.info("@# cri ====>"+cri);
		
		
		
		model.addAttribute("getParty_list", pService.getParty_list(cri));
		int total = pService.getTotalCount();
		log.info("@# total ====>"+total);
		
//		rttr.addAttribute("user", dto);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "shop/list";
	}
	
	@RequestMapping("shop/listNetflix")
	public String party_listNetflix(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listNetflix");
		log.info("@# cri ====>"+cri);
		
		
		model.addAttribute("getParty_list", pService.getParty_listNetflix(cri));
		int total = pService.getNetflixCount();
		log.info("@# total ====>"+total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "shop/listNetflix";
	}
	
	@RequestMapping("shop/listWavve")
	public String party_listWavve(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listWavve");
		log.info("@# cri ====>"+cri);
		
		
		model.addAttribute("getParty_list", pService.getParty_listWavve(cri));
		int total = pService.getWavveCount();
		log.info("@# total ====>"+total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "shop/listWavve";
	}
	
	@RequestMapping("shop/listTving")
	public String party_listtving(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listTving");
		log.info("@# cri ====>"+cri);
		model.addAttribute("getParty_list", pService.getParty_listTving(cri));
		int total = pService.getTivingCount();
		log.info("@# total ====>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "shop/listTving";
	}
	
	@RequestMapping("shop/listDisney")
	public String party_listDisney(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listDisney");
		log.info("@# cri ====>"+cri);
		model.addAttribute("getParty_list", pService.getParty_listDisney(cri));
		int total = pService.getDisneyCount();
		log.info("@# total ====>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "shop/listDisney";
	}
	
	@RequestMapping("shop/listWatcha")
	public String party_listWatcha(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listWatcha");
		log.info("@# cri ====>"+cri);
		model.addAttribute("getParty_list", pService.getParty_listWatcha(cri));
		int total = pService.getWatchaCount();
		log.info("@# total ====>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "shop/listWatcha";
	}
	
	
	
	@RequestMapping("/shop/party_page")
	public String party_page(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model,HttpSession session,RedirectAttributes rttr) {
		// 임시 로그인 세션
//		HttpSession session = request.getSession();
//		session.setAttribute("u_id", 10);
		
		rttr.addAttribute("u_id",session.getAttribute("u_id"));
		log.info("@# u_id==="+session.getAttribute("u_id"));
		
		log.info("@# Controller: party_page");
		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		log.info("party_page@#   param==>"+param);
		model.addAttribute("party", party);

		// 파티장 정보 가져오기
		usersDto master = userService.getUserInfo(party.getU_id());
		model.addAttribute("master", master);

		// 참여자 정보 가져오기
		ArrayList<ApplicationDto> a_list = pService.getParticipantList(param);
		ArrayList<usersDto> participant_list = new ArrayList<usersDto>();
		for (int i = 0; i < a_list.size(); i++) {
			participant_list.add(userService.getUserInfo(a_list.get(i).getU_id()));
			log.info(participant_list.get(i).getU_nickname());
		}
		model.addAttribute("participant_list", participant_list);

		log.info("@# Controller: party_page ==>" + party);
		
		model.addAttribute("pageMaker", param);
		log.info("@# Controller end");
		
		return "shop/party_page";
	}
		
//		임시 로그인(추후 수정 변경 될수 있음)
		@RequestMapping("shop/login")
		public String login() {
			log.info("@#@#@#@#@# login");
			return "shop/login";
		}
		
		@RequestMapping("shop/loginCheck")
		public String loginCheck(@RequestParam HashMap<String, String> param, Model model,HttpSession session) {
			log.info("@# login");
			
			//로그인 창에서 입력한정보
			int u_id=Integer.parseInt(param.get("u_id"));
			String u_pw=param.get("u_pw");
			log.info("@# u_id===>"+u_id);
			log.info("@# u_pw===>"+u_pw);
			
			//오라클 정보
			usersDto dto=userService.getUserInfo(u_id);
			log.info("@# getU_id===>"+dto.getU_id());
			log.info("@# getU_pw===>"+dto.getU_pw());
			
			if (dto != null) {
				if (dto.getU_pw().equals(u_pw)) {
					session.setAttribute("u_id", dto.getU_id());
					session.setAttribute("user", dto);
//					("user", dto);
					log.info("@# login 성공");
					return "redirect:list";
				}else {
					return "shop/login";
				}
			}
			return "shop/login";
		
	}
}
