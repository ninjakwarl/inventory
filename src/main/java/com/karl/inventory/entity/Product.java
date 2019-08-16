package com.karl.inventory.entity;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "products")
public class Product implements Serializable {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "itemcode")
    private String itemCode;
    @Column(name = "name")
    private String productName;
    @Column(name = "uom")
    private String UOM;
    @Column(name = "price")
    private double price;
    @Column(name = "quantity")
    private double quantity;
    @Column(name = "description")
    private String description;
    @Column(name = "whprice")
    private double whPrice;
    @Column(name = "60Days")
    private double SixtyDays;
    @Column(name = "120Days")
    private double OneTwentyDays;
    
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "categoryId")
    private Category category;
    
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "supplierId")
    private Supplier supplier;

    public Product() {
    }

    public Product(long id,  String itemCode, String UOM, String productName, double whPrice, double price, double SixtyDays, double OneTwentyDays,double quantity, String description, Category category, Supplier supplier) {
        this.id = id;
        this.productName = productName;
        this.UOM = UOM;
        this.itemCode = itemCode;
        this.price = price;
        this.whPrice = whPrice;
        this.SixtyDays = SixtyDays;
        this.OneTwentyDays = OneTwentyDays;
        this.quantity = quantity;
        this.description = description;
        this.category = category;
        this.supplier = supplier;
        
    }

    public Product(String productName, String itemCode, String UOM, double price, double whPrice, double SixtyDays, double OneTwentyDays, double quantity, String description, Category category, Supplier supplier) {
        this.productName = productName;
        this.itemCode = itemCode;
        this.UOM = UOM;
        this.price = price;
        this.whPrice = whPrice;
        this.SixtyDays = SixtyDays;
        this.OneTwentyDays = OneTwentyDays;
        this.quantity = quantity;
        this.description = description;
        this.category = category;
        this.supplier = supplier;
    }

    /*public Product(long id, String text, double parseDouble, double parseDouble0, double parseDouble1,double parseDouble2,double parseDouble3, String text0, Category category, Supplier supplier) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/

    /* public Product(String text, double parseDouble, double parseDouble0,double parseDouble1,double parseDouble2,double parseDouble3, String text0, Category category, Supplier supplier) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    } */



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

  

    public double getSixtyDays() {
        return SixtyDays;
    }

    public void setSixtyDays(double SixtyDays) {
        this.SixtyDays = SixtyDays;
    }

    public double getOneTwentyDays() {
        return OneTwentyDays;
    }

    public void setOneTwentyDays(double OneTwentyDays) {
        this.OneTwentyDays = OneTwentyDays;
    }
    
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public double getWhPrice() {
        return whPrice;
    }

    public void setWhPrice(double whPrice) {
        this.whPrice = whPrice;
    }
    
    public String getUOM() {
        return UOM;
    }

    public void setUOM(String UOM) {
        this.UOM = UOM;
    }

    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + 
                ", productName=" + productName + 
                ", itemcode=" + itemCode + 
                ", price=" + price +
                ", whPrice=" + whPrice +
                ", 60days=" + SixtyDays +
                ", 120days=" + OneTwentyDays +
                ", quantity=" + quantity + 
                ", description=" + description + 
                ", category=" + category + 
                ", supplier=" + supplier + '}';
    }

}
