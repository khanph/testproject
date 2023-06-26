package com.lgy.shallweshare.users.service;

import java.util.HashMap;

import com.lgy.shallweshare.users.dto.usersDto;

public interface usersService {
	public usersDto getUserInfo(int u_id);
	public void editProfile(HashMap<String, String> param);
}
