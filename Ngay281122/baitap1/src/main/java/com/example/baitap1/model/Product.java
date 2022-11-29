package com.example.baitap1.model;

public class Product {
    private Long id;
    private String name;
    private double price;
    private Origin origin;

    public Product() {
    }

    public Product(Long id, String name, double price, Origin origin) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.origin = origin;
    }

    public Product(String name, double price, Origin origin) {
        this.name = name;
        this.price = price;
        this.origin = origin;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public Origin getOrigin() {
        return origin;
    }

    public void setOrigin(Origin origin) {
        this.origin = origin;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", origin=" + origin +
                '}';
    }
}
