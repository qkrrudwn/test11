package com.model2.mvc.web.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	@Autowired   
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductRestController(){
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public Product addProduct(@RequestBody Product product ) throws Exception {
		System.out.println("addProduct Check :: " + product);
		productService.addProduct(product);

		return product;
	}

	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct(@PathVariable int prodNo, Model model, HttpServletRequest request) throws Exception {

		System.out.println("getproductcheck ::: ");
		
		Product product = productService.getProduct(prodNo);

		System.out.println("product check :: " + product);
		
		
		//model.addAttribute("product", product);

//		if ("manage".equals(request.getParameter("menu"))) {
//			return "forward:/product/updateProduct.jsp";	
//		}
		return product;
	}
	
	@RequestMapping(value="json/listProduct" , method=RequestMethod.POST)
	public Map<String, Object> listProduct(@RequestBody Search search ) throws Exception {

		

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

	String menu = null;
		Map<String , Object> map=productService.getProductList(search,menu);            					

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		
		map.put("resultPage", resultPage);
		map.put("search", search);
	
//		
		System.out.println("map.get(\"list\") ::::::::::::::::::::::::: "  +  map.get("list"));
	
		

		return map;										
	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public Product UpdateProduct(@RequestBody Product product, Model model , HttpSession session) throws Exception{
			
			productService.updateProduct(product);
			
		//  return "redirect:/getProduct?prodNo="+prodNo;
			
			return product;
		}
	@RequestMapping(value="json/productGetName" , method=RequestMethod.GET)
	public List<String> productGetName() throws Exception{
	
		List<String> productName = productService.productGetName();
		System.out.println("productName :: " + productName);
		return productName;
	}

}
