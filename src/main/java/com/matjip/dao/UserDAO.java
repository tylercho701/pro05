package com.matjip.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.dto.UserDTO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*
	public String checkUserIdExist(String user_id) {
		String user_name = sqlSessionTemplate.selectOne("user.checkUserIdExist", user_id);
		return user_name;
	}
	*/
	
	public UserDTO checkExistUser(UserDTO userDTO) {
		UserDTO loggedUserInfo = sqlSessionTemplate.selectOne("user.checkExistUser", userDTO);
		return loggedUserInfo;
	}
	
	public String checkUserIdExist(String user_id) {
		String user_name = sqlSessionTemplate.selectOne("user.checkUserIdExist", user_id);
		return user_name;
	}
	
	public void insertUser(UserDTO joinUserBean) {
		sqlSessionTemplate.insert("user.insertUser", joinUserBean);
	}
	
	public void updateUser(UserDTO updateUserBean) {
		sqlSessionTemplate.update("user.updateUser", updateUserBean);
	}
	
	public UserDTO getLoggedUserInfo(String sid) {
		UserDTO loggedUserInfo = sqlSessionTemplate.selectOne("user.getLoggedUserInfo", sid);
		
		return loggedUserInfo;
	}
	
	public void deleteUser(String user_id) {
		sqlSessionTemplate.delete("user.deleteUser", user_id);
	}
	
}
