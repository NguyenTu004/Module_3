package com.example.baitap1.service;

import com.example.baitap1.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product  findById(Long id);
    public void save(Product product) ;

    Product update(long id, Product product);

    List<Product> delete(long id);

}
