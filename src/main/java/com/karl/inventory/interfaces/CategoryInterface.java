package com.karl.inventory.interfaces;

import com.karl.inventory.entity.Category;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public interface CategoryInterface {
    
    public ObservableList<Category> CATEGORYLIST = FXCollections.observableArrayList();   
}
