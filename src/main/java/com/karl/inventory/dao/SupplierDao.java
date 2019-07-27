package com.karl.inventory.dao;

import com.karl.inventory.entity.Supplier;
import javafx.collections.ObservableList;

public interface SupplierDao {
    
    public ObservableList<Supplier> getSuppliers();
    public Supplier getSupplier(long id);
    public void saveSuplier(Supplier supplier);
    public void updateSuplier(Supplier supplier);
    public void deleteSuplier(Supplier supplier);
    public ObservableList<String> getNames();
}
