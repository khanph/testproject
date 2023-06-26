package com.lgy.shallweshare.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.shallweshare.admin.dto.reportDto;
import com.lgy.shallweshare.mypage.dto.ApplicationPartyDto;
import com.lgy.shallweshare.mypage.service.MyPageService;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.users.dto.usersDto;
import com.lgy.shallweshare.users.service.usersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("mypage")
public class MyPageController {
	@Autowired 
	private MyPageService mService;

	@Autowired
	private usersService uService;
	
//	=============== 내 파티 보기 ===============
	@RequestMapping("my_partyList")
	public String my_partyList(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
		// 임시 로그인 세션
		HttpSession session = request.getSession();
		session.setAttribute("u_id", 7);
		log.info("@# Controller: ");
		log.info("@# Controller: my_partyList");
		
		ArrayList<PartyDto> myPartyList = mService.getMyPartyList(param);
		model.addAttribute("myPartyList",myPartyList);
		
		ArrayList<ApplicationPartyDto> myApplicationList = mService.getMyApplicationList(param);
		model.addAttribute("myApplicationList",myApplicationList);
		
		return "mypage/my_partyList";
	}	
	
//	=============== 게시글 수정 페이지===============
	@RequestMapping("edit_profile")
	public String edit_profile(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: edit_profile");
		// 임시 로그인 세션
		HttpSession session = request.getSession();
		session.setAttribute("u_id", 7);

		usersDto user = uService.getUserInfo(Integer.parseInt(param.get("u_id").toString()));
		model.addAttribute("user",user);
		return "mypage/edit_profile";
	}
	
//	=============== 게시글 수정 메소드===============
	@RequestMapping("edit_profileProcess")
	public String edit_profileProcess(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: edit_profileProcess");
		uService.editProfile(param);
		return "redirect:edit_profile?u_id="+param.get("u_id");
	}
	
//	=============== 내 신고내역 보기 ===============
	@RequestMapping("my_reportList")
	public String my_reportList(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: my_reportList");
		
		ArrayList<reportDto> myReportList = mService.getMyReportList(param);
		model.addAttribute("myReportList",myReportList);
		return "mypage/my_reportList";
	}	
}
