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

public class EditController implements Initializable, ProductInterface {

    @FXML
    private TextField nameField, itemcodeField, whpriceField, SixtyDaysField, OneTwentyDaysField, priceField, quantityField;
    @FXML
    private TextArea descriptionArea;
    @FXML
    private ComboBox categoryBox, supplierBox;
    @FXML
    private Button saveButton;
    private ProductModel productModel;
    private CategoryModel categoryModel;
    private SupplierModel supplierModel;
    private Product product;
    private long selectedProductId;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        productModel = new ProductModel();
        categoryModel = new CategoryModel();
        supplierModel = new SupplierModel();
        ObservableList<String> categoryList = FXCollections.observableArrayList(categoryModel.getTypes());
        ObservableList<String> supplierList = FXCollections.observableArrayList(supplierModel.getNames());
        categoryBox.setItems(categoryList);
        supplierBox.setItems(supplierList);
        resetValues();
    }

    public void setProduct(Product product, long selectedProductId) {
        this.product = product;
        this.selectedProductId = selectedProductId;
        setData();
    }

    private void setData() {
        nameField.setText(product.getProductName());
        itemcodeField.setText(product.getItemCode());
        priceField.setText(String.valueOf(product.getPrice()));
        whpriceField.setText(String.valueOf(product.getWhPrice()));
        SixtyDaysField.setText(String.valueOf(product.getSixtyDays()));
        OneTwentyDaysField.setText(String.valueOf(product.getOneTwentyDays()));
        quantityField.setText(String.valueOf(product.getQuantity()));
        descriptionArea.setText(String.valueOf(product.getDescription()));
        
        categoryBox.getSelectionModel().select(((int) product.getCategory().getId()) - 1);
        supplierBox.getSelectionModel().select(((int) product.getSupplier().getId()) - 1);
    }

    @FXML
    public void handleSave(ActionEvent event) {

        if (validateInput()) {
            Category category = categoryModel.getCategory(categoryBox.getSelectionModel().getSelectedIndex() + 1);
            Supplier supplier = supplierModel.getSupplier(supplierBox.getSelectionModel().getSelectedIndex() + 1);
            Product editedProduct = new Product(
                    product.getId(),
                    itemcodeField.getText(),
                    nameField.getText(),
                    Double.parseDouble(priceField.getText()),
                    Double.parseDouble(whpriceField.getText()),
                    Double.parseDouble(SixtyDaysField.getText()),
                    Double.parseDouble(OneTwentyDaysField.getText()),
                    Double.parseDouble(quantityField.getText()),
                    descriptionArea.getText(),
                    category,
                    supplier
            );

            productModel.updateProduct(editedProduct);
            PRODUCTLIST.set((int) selectedProductId, editedProduct);

            ((Stage) saveButton.getScene().getWindow()).close();

            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Successful");
            alert.setHeaderText("Product Updated!");
            alert.setContentText("Product is updated successfully");
            alert.showAndWait();
        }
    }

    private void resetValues() {
        itemcodeField.setText("");
        nameField.setText("");
        priceField.setText("");
        whpriceField.setText("");
        SixtyDaysField.setText("");
        OneTwentyDaysField.setText("");
        quantityField.setText("");
        descriptionArea.setText("");
        categoryBox.valueProperty().setValue(null);
        supplierBox.valueProperty().setValue(null);
    }

    @FXML
    public void handleCancel(ActionEvent event) {
        resetValues();
    }

    private boolean validateInput() {

        String errorMessage = "";

        if (itemcodeField.getText() == null || itemcodeField.getText().length() == 0) {
            errorMessage += "Not valid item code!\n";
        }
        
        if (nameField.getText() == null || nameField.getText().length() == 0) {
            errorMessage += "Not valid name!\n";
        }
        
        if (priceField.getText() == null || priceField.getText().length() == 0) {
            errorMessage += "Not valid price!\n";
        }
        
        if (whpriceField.getText() == null || whpriceField.getText().length() == 0) {
            errorMessage += "Not valid 30 Days price!\n";
        }
        if (SixtyDaysField.getText() == null || SixtyDaysField.getText().length() == 0) {
            errorMessage += "Not valid 60 Days price!\n";
        }
        if (OneTwentyDaysField.getText() == null || OneTwentyDaysField.getText().length() == 0) {
            errorMessage += "Not valid 120 Days price!\n";
        }

        if (quantityField.getText() == null || quantityField.getText().length() == 0) {
            errorMessage += "Not valid quantity!\n";
        }

        if (descriptionArea.getText() == null || descriptionArea.getText().length() == 0) {
            errorMessage += "No email description!\n";
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
