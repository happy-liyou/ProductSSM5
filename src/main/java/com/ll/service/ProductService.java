package com.ll.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ll.bean.Category;
import com.ll.bean.Product;
import com.ll.dao.ProductMapper;

@Service
public class ProductService {
	@Autowired
	private ProductMapper mapper;

	public List<Product> queryProducts() {
		List<Product> products = mapper.queryProducts();
		for (Product product : products) {
			int pid = product.getId();
			List<Category> categories = mapper.queryCategories(pid);
			product.setCategories(categories);
		}
		return products;
	}

	public int insertProduct(Product product) {
		int result = mapper.insertProduct(product);
		System.out.println(product);
		if (result > 0) {
			String cids = product.getCids();
			int pid = product.getId();
			System.out.println(pid);
			System.out.println(cids);
			if (cids != null) {
				String[] ids = cids.split(",");
				Map<Object, Object> map = new HashMap<>();
				map.put("pid", pid);
				map.put("cids", ids);
				mapper.insertProduct_category(map);
			}
		}
		return result;
	}

	public int deleteProduct(int id) {
		mapper.deleteProduct_category(id);
		return mapper.deleteProduct(id);

	}

	public Product queryProduct(int id) {
		Product product = mapper.queryProduct(id);
		int pid = product.getId();
		List<Category> categories = mapper.queryCategories(pid);
		product.setCategories(categories);
		System.out.println(product);
		return product;
	}

	public int updateProduct(Product product) {
		int id = product.getId();
		mapper.deleteProduct_category(id);

		String[] cids = product.getCids().split(",");
		int pid = product.getId();
		Map<Object, Object> map = new HashMap<>();
		map.put("pid", pid);
		map.put("cids", cids);
		mapper.insertProduct_category(map);

		int result = mapper.updateProduct(product);
		System.out.println(product);
		return result;
	}

	public List<Category> queryAllCategories() {
		return mapper.queryAllCategories();
	}

}
