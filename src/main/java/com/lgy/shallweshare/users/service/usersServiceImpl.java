package com.lgy.shallweshare.users.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.users.dao.usersDao;
import com.lgy.shallweshare.users.dto.usersDto;

import lombok.extern.slf4j.Slf4j;
@Service("usersService")
@Slf4j
public class usersServiceImpl implements usersService{

	@Autowired
	private SqlSession sqlSession;
	
//	=============== 유저 정보 받아오기(개인) ===============
	@Override
	public usersDto getUserInfo(int u_id) {
		log.info("@# Service: getUserInfo");
		usersDao dao = sqlSession.getMapper(usersDao.class);
		usersDto user = dao.getUserInfo(u_id);
		
		return user;
	}

	@Override
	public void editProfile(HashMap<String, String> param) {
		log.info("@# Service: editProfile");
		usersDao dao  = sqlSession.getMapper(usersDao.class);
		dao.editProfile(param);
	}
}
