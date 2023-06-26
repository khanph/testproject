package com.lgy.shallweshare.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.admin.dto.reportDto;
import com.lgy.shallweshare.mypage.dto.ApplicationPartyDto;
import com.lgy.shallweshare.party.dto.PartyDto;

public interface MyPageService {

	public ArrayList<PartyDto> getMyPartyList(HashMap<String, String> param);
	public ArrayList<ApplicationPartyDto> getMyApplicationList(HashMap<String, String> param);
	public ArrayList<reportDto> getMyReportList(HashMap<String, String> param);
}
