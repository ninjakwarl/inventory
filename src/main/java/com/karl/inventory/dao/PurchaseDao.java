package com.karl.inventory.dao;

import com.karl.inventory.entity.Purchase;
import javafx.collections.ObservableList;

public interface PurchaseDao {
    
    public ObservableList<Purchase> getPurchases();
    public Purchase getPurchase(long id);
    public void savePurchase(Purchase purchase);
    public void updatePurchase(Purchase purchase);
    public void deletePurchase(Purchase purchase);
}
