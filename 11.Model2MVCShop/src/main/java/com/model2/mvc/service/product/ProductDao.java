package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;


public interface ProductDao {

	// INSERT
		public void addProduct(Product product) throws Exception ;

		// SELECT ONE
		public Product getProduct(int prodNo) throws Exception ;

		
		public List<Product> getProductListManage(Search search) throws Exception ;
		
		public List<Product> getProductListSearch(Search search) throws Exception ;
		

		// UPDATE
		public void updateProduct(Product product) throws Exception ;
		
		
		public int getTotalCount(Search search) throws Exception ;
		
		public List<String> productGetName() throws Exception;
		
		public void updateCnt(Purchase purchase) throws Exception;

}
