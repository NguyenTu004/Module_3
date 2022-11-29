package com.example.baitap1.model;

public class Origin {
    private String name;

    public Origin() {
    }

    public Origin(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
