package com.karl.inventory.interfaces;

import com.karl.inventory.entity.Sale;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public interface SaleInterface {

    public ObservableList<Sale> SALELIST = FXCollections.observableArrayList();
}
