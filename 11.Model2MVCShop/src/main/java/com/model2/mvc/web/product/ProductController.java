package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired   
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController(){
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	private static final String uploadpath = "C:\\Users\\roskk\\eclipse-workspace\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles";
	
	
	
	@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product,Model model,MultipartFile file ) throws Exception {
	
		
		
		if(file.getOriginalFilename() == null) {
		
		File fileName = new File(uploadpath,file.getOriginalFilename());
		try {
	        file.transferTo(fileName); 
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
		
		product.setFileName(file.getOriginalFilename());
		}
		
		
		productService.addProduct(product);
		
		model.addAttribute("product", product);
		
		return "forward:/product/addProductView1.jsp";
	}

	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request) throws Exception {

		Product product = productService.getProduct(prodNo);

		model.addAttribute("product", product);

		if ("manage".equals(request.getParameter("menu"))) {
			return "forward:/product/updateProduct.jsp";	
		}
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search ,Model model, HttpServletRequest request) throws Exception {

		
		System.out.println("=================");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		System.out.println("==========================");
		Map<String , Object> map=productService.getProductList(search);            					

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		model.addAttribute("list", map.get("list"));											
		model.addAttribute("resultPage", resultPage);											
		model.addAttribute("search", search);		
		
		System.out.println("map.get(\"list\") ::::::::::::::::::::::::: "  +  map.get("list"));
		System.out.println("============================");

		

		return "forward:/product/listProduct.jsp";													
	}
	
	@RequestMapping( value="UpdateProduct", method=RequestMethod.POST )
	public String UpdateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{
			System.out.println("check :::::::");
			productService.updateProduct(product);
			System.out.println("check ::::");
			return "forward:/product/getProduct.jsp";



		}

	}
