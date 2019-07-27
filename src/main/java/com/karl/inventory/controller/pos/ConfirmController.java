package com.karl.inventory.controller.pos;

import com.karl.inventory.entity.Item;
import com.karl.inventory.pdf.PrintInvoice;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.Node;
import javafx.scene.control.TextArea;

public class ConfirmController implements Initializable {

    @FXML
    private TextArea billingArea;
    @FXML
    private Label retailLabel;
    private double retail;
    private ObservableList<Item> items;
    private String barcode;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        retailLabel.setText("Change: ₱" + retail);

        StringBuilder details = new StringBuilder("Item Name\t\t" + "Cost\t\t" + "Quantity\t\t" + "Total\n");

        for (Item i : items) {
            details.append(i.getItemName())
                    .append("\t\t\t")
                    .append(i.getUnitPrice())
                    .append("\t\t\t")
                    .append(i.getQuantity())
                    .append("\t\t\t")
                    .append(i.getTotal())
                    .append("\n");
        }

        billingArea.setText(details.toString());
    }

    public void setData(double retail, ObservableList<Item> items, String barcode) {
        this.retail = retail;
        this.items = FXCollections.observableArrayList(items);
        this.barcode = barcode;
    }

    @FXML
    public void doneAction(ActionEvent event) throws IOException {
        billingArea.setText("");
        PrintInvoice pi = new PrintInvoice(items, barcode);
        pi.generateReport();
        /* KJS: Added xTransfer baatch script to copy manually to the desired folder please edit this one */
         ProcessBuilder pb = new ProcessBuilder("cmd", "/c", "xtransfer.bat");
            File dir = new File("C:/");
            pb.directory(dir);
            Process p = pb.start();
            /* End of the line code*/
        ((Node) (event.getSource())).getScene().getWindow().hide();
    }
}
