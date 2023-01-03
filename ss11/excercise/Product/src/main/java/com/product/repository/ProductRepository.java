package com.product.repository;

import com.product.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1, "iphone 8", 500, "new", "Apple"));

        productMap.put(2, new Product(2, "iphone X", 600, "new", "Apple"));
        productMap.put(3, new Product(3, "iphone XSMAX", 700, "new", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(int id, Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    public List<Product> searchByName(String name){
        List<Product> productSearchList = new ArrayList<>();
        for (Product product:findAll()) {
            if (product.getName().contains(name)){
                productSearchList.add(product);
            }
        }
        return productSearchList;
    }
}
