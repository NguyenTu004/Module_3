package com.example.baitap1.service;

import com.example.baitap1.model.Origin;
import com.example.baitap1.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImp implements ProductService{
    private static List<Product> products ;
    private static List<Origin> originList ;
    private static long INDEX;
    static {
        products=new ArrayList<>();
        originList=new ArrayList<>();
        originList.add(new Origin("Viet Nam"));
        originList.add(new Origin("Japan"));
        originList.add(new Origin("China"));
        products.add(new Product(1L,"bimbim",12000,originList.get(1)));
        products.add(new Product(2L,"banh mi",10000,originList.get(2)));
        INDEX = products.get(products.size()-1).getId();
    }
    public List<Origin> findOrigin() {
        return originList;
    }
    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public Product findById(Long id) {
        for (Product p : products) {
            if (p.getId().equals(id)) {
                return p;
            }
        }
        return null;
    }

    @Override
    public void save(Product product) {
        if (product.getId() == null) {
            product.setId(++INDEX);
        }
        products.add(product);
    }

    @Override
    public Product update(long id, Product product) {
        return null;
    }

    @Override
    public  List<Product>  delete(long id) {
        for (Product product : products){
            if (product.getId().equals(id)){
                products.remove(product);
                break;
            }
        }
        return products;
    }

}
