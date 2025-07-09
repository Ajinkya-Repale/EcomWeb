package com.MainApp.Controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MainApp.Entity.Product;
import com.MainApp.Service.ProductService;

@Controller
public class UserHome {

	@Autowired
	ProductService pService;
	
	@RequestMapping(value = "/filter")
	public String HandelFilter(
	@Param("pcategory") String pcategory,Model model 		
	)
	{
		List<Product> lap = pService.getAllProductsByPcategory(pcategory);
		model.addAttribute("lap",lap);
		
		Set<String> sc = pService.getPcategory();
		model.addAttribute("categories",sc);
		
		
		return "userhome";
	}
	
}
