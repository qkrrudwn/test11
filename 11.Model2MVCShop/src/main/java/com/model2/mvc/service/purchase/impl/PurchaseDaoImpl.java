package com.model2.mvc.service.purchase.impl;


import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	///Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	public Purchase getPurchase1(int tranNo) throws Exception {
		System.out.println("tranNo" + tranNo);
		return sqlSession.selectOne("PurchaseMapper.getPurchase1", tranNo);
	}

	public Purchase getPurchase2(int prodNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase2", prodNo);
	}

	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception {
		
		Map<String, Object> map = new HashMap();
		map.put("buyerId", buyerId);
		map.put("search", search);
		
		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
		
		return list;
	}

	public HashMap<String, Object> getSaleList(Search search) throws Exception {
		return null;
	}

	public void updatePurcahse(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	public void updateTranCode(Purchase purchase) throws Exception {
		System.out.println("update trancode check :::" + purchase );
		sqlSession.update("PurchaseMapper.updateTrancode", purchase);
	}

	public int getTotalCount(String buyerId) {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", buyerId);
	}
}