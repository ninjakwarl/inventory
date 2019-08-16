package com.karl.inventory.controller.product;

import com.karl.inventory.interfaces.ProductInterface;
import com.karl.inventory.entity.Category;
import com.karl.inventory.entity.Product;
import com.karl.inventory.entity.Supplier;
import com.karl.inventory.model.CategoryModel;
import com.karl.inventory.model.ProductModel;
import com.karl.inventory.model.SupplierModel;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class AddController implements Initializable, ProductInterface {

    @FXML
    private TextField nameField, priceField, whpriceField, itemcodeField, SixtyDaysField, OneTwentyDaysField, quantityField, uomField;
    @FXML
    private TextArea descriptionArea;
    @FXML
    private ComboBox categoryBox, supplierBox;
    @FXML
    private Button saveButton;
    private ProductModel productModel;
    private CategoryModel categoryModel;
    private SupplierModel supplierModel;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        productModel = new ProductModel();
        categoryModel = new CategoryModel();
        supplierModel = new SupplierModel();
        ObservableList<String> categoryList = FXCollections.observableArrayList(categoryModel.getTypes());
        ObservableList<String> supplierList = FXCollections.observableArrayList(supplierModel.getNames());
        categoryBox.setItems(categoryList);
        supplierBox.setItems(supplierList);
    }

    @FXML
    public void handleSave(ActionEvent event) {

        if (validateInput()) {

            Category category = categoryModel.getCategory(categoryBox.getSelectionModel().getSelectedIndex() + 1);
            Supplier supplier = supplierModel.getSupplier(supplierBox.getSelectionModel().getSelectedIndex() + 1);
            Product product = new Product(
                    nameField.getText(),
                    itemcodeField.getText(),
                    uomField.getText(),
                    Double.parseDouble(priceField.getText()),
                    Double.parseDouble(whpriceField.getText()),
                    Double.parseDouble(SixtyDaysField.getText()),
                    Double.parseDouble(OneTwentyDaysField.getText()),
                    Double.parseDouble(quantityField.getText()),
                    descriptionArea.getText(),
                    category,
                    supplier
            );

            productModel.saveProduct(product);
            PRODUCTLIST.clear();
            PRODUCTLIST.addAll(productModel.getProducts());

            ((Stage) saveButton.getScene().getWindow()).close();

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Successful");
            alert.setHeaderText("Product is added");
            alert.setContentText("Product is added successfully");
            alert.showAndWait();
        }
    }

    @FXML
    public void handleCancel(ActionEvent event) {
        nameField.setText("");
        priceField.setText("");
        whpriceField.setText("");
        itemcodeField.setText("");
        SixtyDaysField.setText("");
        OneTwentyDaysField.setText("");
        quantityField.setText("");
        descriptionArea.setText("");
        categoryBox.valueProperty().setValue(null);
    }

    private boolean validateInput() {

        String errorMessage = "";

        if (nameField.getText() == null || nameField.getText().length() == 0) {
            errorMessage += "Not valid name!\n";
        }
        
        if (itemcodeField.getText() == null || itemcodeField.getText().length() == 0) {
            errorMessage += "Not valid item code!\n";
        }

        if (priceField.getText() == null || priceField.getText().length() == 0) {
            errorMessage += "Not valid price!\n";
        }
       
        if (priceField.getText() == null || whpriceField.getText().length() == 0) {
            errorMessage += "Not valid wholesale price!\n";
        }
        if (priceField.getText() == null || SixtyDaysField.getText().length() == 0) {
            errorMessage += "Not valid 60 Days price!\n";
        }
        if (priceField.getText() == null || OneTwentyDaysField.getText().length() == 0) {
            errorMessage += "Not valid 120 Days price!\n";
        }
        
        if (quantityField.getText() == null || quantityField.getText().length() == 0) {
            errorMessage += "Not valid quantity!\n";
        }

        if (descriptionArea.getText() == null || descriptionArea.getText().length() == 0) {
            errorMessage += "Not email description!\n";
        }

        if (categoryBox.getSelectionModel().isEmpty()) {
            errorMessage += "Please select the category!\n";
        }

        if (errorMessage.length() == 0) {
            return true;
        } else {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Invalid Fields");
            alert.setHeaderText("Please correct invalid fields");
            alert.setContentText(errorMessage);
            alert.showAndWait();

            return false;
        }
    }

    @FXML
    public void closeAction(ActionEvent event) {
        ((Node) (event.getSource())).getScene().getWindow().hide();
    }
}
