package com.ll.dao;

import java.util.List;
import java.util.Map;

import com.ll.bean.Category;
import com.ll.bean.Product;

public interface ProductMapper {
	
	public Product queryProduct(int id);
	public List<Product> queryProducts();
	public List<Category> queryCategories(int pid);
	public int insertProduct(Product product);
	public int insertProduct_category(Map<Object, Object> map);
	public int deleteProduct(int id);
	public int deleteProduct_category(int id);
	public int updateProduct(Product product);
	public int updateProduct_category(Map<Object, Object> map);
	public List<Category> queryAllCategories();
	
	
	
}
