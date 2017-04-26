package com.kaishengit;

import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;
import com.kaishengit.entity.User;

public class Test2 {
	
	public static void main(String[] args) {
		User user1 = new User(1,"王杰","郑州");
		User user2 = new User(2,"张三","许昌");
		User user3 = new User(3,"李四","焦作");
		
		List<User> userList = Arrays.asList(user1,user2,user3);
		
		String json = new Gson().toJson(userList);
		
		System.out.println(json);
	}
	
	
}
