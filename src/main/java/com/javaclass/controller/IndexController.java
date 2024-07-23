package com.javaclass.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.service.ShoppingService;

@Controller
public class IndexController {
	
	@Autowired
	private ShoppingService productservice;

	@RequestMapping("index2.do")
	public void index2(Model m) {
		
		List list = new ArrayList();
		list = productservice.getRecomProductList();
		System.out.println(list);
		m.addAttribute("productlist",list);
	}
	
	@RequestMapping("index.do")
	public String index3() {
		return "index2";
	}
	
	

	@RequestMapping("/{step}.do")
	public String viewPage(@PathVariable String step) {
		System.out.println(step +"요청 불려짐");
		return step;
	}
}
