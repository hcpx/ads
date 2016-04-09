package com.edu.ads.common.utils;

import java.util.UUID;

public class CommonUtils {

	public static void main(String[] args){
		System.out.println( getUUid());
	}
	
	
	public static String getUUid(){
		String uuid = UUID.randomUUID().toString();
		return uuid.replaceAll("-","");
	}
}
