package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public PurchaseController() {
		System.out.println("purchase check :::: server");
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	//보여주기 위한 용도  2222222222222222222222222222post
	//@RequestMapping("/addPurchase.do")
	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, @ModelAttribute("product") Product product,HttpSession session) throws Exception {

		String divyDate = purchase.getDivyDate();
		divyDate = divyDate.replaceAll("-", "");
		
		purchase.setDivyDate(divyDate);
		purchase.setPurchaseProd(product);
		purchase.setTranCode("1");

		User user = (User) session.getAttribute("user");
		purchase.setBuyer(user);
		
		System.out.println("purchase :: " + purchase);
		purchaseService.addPurchase(purchase);
		System.out.println("purchase ::: " + purchase);
		return "forward:/purchase/addPurchase.jsp"; 
	}

	//@RequestMapping("/addPurchaseView.do") //제품상세조회1111111111111111111111111111111111111get
	@RequestMapping(value="addPurchaseView", method=RequestMethod.GET)
	public String addPurchaseView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

			Product product = productService.getProduct(prodNo);
		
			
		
		model.addAttribute("product", product);

		return "forward:/purchase/addPurchaseView.jsp";
	}

	//@RequestMapping("/getPurchase.do") //구매상세조회 3333333333333333333333333get
	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public String getPurchase(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("check getPurchase :::");
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		System.out.println("purchase check :::" + purchase);

		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}


	//@RequestMapping("/listPurchase.do")
	@RequestMapping(value="listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception {

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);

		User user = (User) session.getAttribute("user");

		Map<String , Object> map=purchaseService.getPurchaseList(search,user.getUserId());

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		model.addAttribute("list", map.get("list"));											
		model.addAttribute("resultPage", resultPage);											
		model.addAttribute("search", search);

		return "forward:/purchase/listPurchase.jsp";
	}

	//@RequestMapping("/updatePurchaseView.do")4444444444444444444444GET
	@RequestMapping(value="updatePurchaseView", method=RequestMethod.GET)
	public String updatePurchaseView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		System.out.println("check addpurchase:::::::::::::::::::::");
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		
		model.addAttribute("purchase",purchase);

		return "forward:/purchase/updatePurchaseView.jsp";
	}
	//@RequestMapping("/updatePurchase.do")5555555555555555555post
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public String updatePurchase(@RequestParam("prodNo") int prodNo , @ModelAttribute("purchase") Purchase purchase) throws Exception {
		System.out.println("check updatepurchase ::: ");

		Product product = new Product();
		
		product.setProdNo(prodNo);
		purchase.setPurchaseProd(product);

		purchaseService.updatePurcahse(purchase);

		//return "forward:/getPurchase";
				return "forward:/purchase/getPurchase.jsp";
	}

	//@RequestMapping("/updateTranCode.do")66666666666666666get
	@RequestMapping(value="updateTranCode", method=RequestMethod.GET)
	public String updateTranCode(@ModelAttribute("product") Product product ,@RequestParam("proTranCode") String proTranCode , @ModelAttribute("purchase") Purchase purchase,@RequestParam("prodNo") int prodNo,@RequestParam("tranNo") String tranNo ) throws Exception {

//		purchase.setTranCode(proTranCode);
//		purchase.setPurchaseProd(product);
		
System.out.println("tranNo check :::" + tranNo);
		
		purchase = purchaseService.getPurchase1(Integer.parseInt(tranNo));
		
		System.out.println("purchase check1 :::" + purchase);
		
		purchaseService.updateTranCode(purchase);

		System.out.println("purchase check2 :::" + purchase);
		
		
		if(purchase.getTranCode().trim().equals("2")) {

			return "forward:/purchase/listPurchase";	
		}
		return "forward:/product/listProduct"; 
	}


}
