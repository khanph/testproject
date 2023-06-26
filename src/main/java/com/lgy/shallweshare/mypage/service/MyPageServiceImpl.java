package com.lgy.shallweshare.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.admin.dto.reportDto;
import com.lgy.shallweshare.mypage.dao.MyPageDao;
import com.lgy.shallweshare.mypage.dto.ApplicationPartyDto;
import com.lgy.shallweshare.party.dto.PartyDto;

import lombok.extern.slf4j.Slf4j;

@Service("MyPageService")
@Slf4j
public class MyPageServiceImpl implements MyPageService {
	@Autowired
    private	SqlSession sqlSession;
	
	@Override
	public ArrayList<PartyDto> getMyPartyList(HashMap<String, String> param) {
		log.info("@# Service: getMyPartyList");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getMyPartyList(param);
	}

	@Override
	public ArrayList<ApplicationPartyDto> getMyApplicationList(HashMap<String, String> param) {
		log.info("@# Service: getMyApplicationList");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getMyApplicationList(param);
	}
	
	@Override
	public ArrayList<reportDto> getMyReportList(HashMap<String, String> param) {
		log.info("@# Service: getMyApplicationList");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getMyReportList(param);
	}
}
