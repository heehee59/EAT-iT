package com.web.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WebImpl {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception; 
}
