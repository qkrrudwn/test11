package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;
import java.util.UUID;

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

	private static final String uploadpath = "C:\\Users\\roskk\\git\\test11\\11.Model2MVCShop\\WebContent\\images\\uploadFiles";



	@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product,Model model, MultipartFile file ) throws Exception {

		// 파일이 있으면 if문 안으로
		if(file.getOriginalFilename() != null) {
			//파일객체를 읽을 수 있도록 하는거
			File fileName = new File(uploadpath,file.getOriginalFilename());
			try {//request한 파일을 객에파일에 변환
				file.transferTo(fileName); 
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}

	
//			int productCNT = 10;
//			
//			productCNT = productCNT - product.getProductCNT();
		
			product.setFileName(file.getOriginalFilename());
		}

		System.out.println("product toString :: " + product);

		productService.addProduct(product);

		model.addAttribute("product", product);

		return "forward:/product/addProductView1.jsp";
	}

	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct(@RequestParam("prodNo") int prodNo,@RequestParam("menu") String menu, Model model, HttpServletRequest request) throws Exception {

		Product product = productService.getProduct(prodNo);
		System.out.println("menu:::" + menu);
		model.addAttribute("product", product);

		if ("manage".equals(request.getParameter("menu"))) {
			return "forward:/product/updateProduct.jsp";	
		}
		return "forward:/product/getProduct.jsp";
	}

	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search ,Model model, HttpServletRequest request,@RequestParam("menu") String menu) throws Exception {

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("menu check :::" + menu);
		Map<String , Object> map=productService.getProductList(search,menu);            					

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		model.addAttribute("list", map.get("list"));											
		model.addAttribute("resultPage", resultPage);											
		model.addAttribute("search", search);		

		System.out.println("map.get(\"list\") ::::::::::::::::::::::::: "  +  map.get("list"));

		return "forward:/product/listProduct.jsp";													
	}

	@RequestMapping( value="UpdateProduct", method=RequestMethod.POST )
	public String UpdateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session, MultipartFile file) throws Exception{



		// 파일이 있으면 if문 안으로
		if(file.getOriginalFilename() != null) {
			//파일객체를 읽을 수 있도록 하는거
			File fileName = new File(uploadpath,file.getOriginalFilename());
			try {//request한 파일을 객에파일에 변환
				file.transferTo(fileName); 
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}

			product.setFileName(file.getOriginalFilename());
		}
		productService.updateProduct(product);
		product =	productService.getProduct(product.getProdNo());


		model.addAttribute("product", product);

		return "forward:/product/getProduct.jsp";



	}

}
