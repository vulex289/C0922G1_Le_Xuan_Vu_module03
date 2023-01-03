package com.product.repository;

import com.product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(int id, Product product);

    void remove(int id);

    void update(int id, Product product);

    Product findById(int id);
    public List<Product> searchByName(String name);
}
