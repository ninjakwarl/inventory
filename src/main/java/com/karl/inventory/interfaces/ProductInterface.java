package com.karl.inventory.interfaces;

import com.karl.inventory.entity.Product;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public interface ProductInterface {
    
    public ObservableList<Product> PRODUCTLIST = FXCollections.observableArrayList();   
}
