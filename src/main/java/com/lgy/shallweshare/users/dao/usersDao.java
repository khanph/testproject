package com.lgy.shallweshare.users.dao;

import java.util.HashMap;

import com.lgy.shallweshare.users.dto.usersDto;

public interface usersDao {
	public usersDto getUserInfo(int u_id);
	public void editProfile(HashMap<String, String> param);
}
