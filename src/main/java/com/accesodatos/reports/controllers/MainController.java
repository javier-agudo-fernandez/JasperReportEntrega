package com.accesodatos.reports.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;

public class MainController {

    @FXML private ComboBox<String> comboReportes;
    @FXML private VBox parametrosBox;
    @FXML private TextField idUsuarioField;
    @FXML private DatePicker fechaInicioPicker;
    @FXML private DatePicker fechaFinPicker;
    @FXML private Label labelParametros;

    private Stage stage;

    @FXML
    public void initialize() {

        comboReportes.getItems().addAll("LibMasPrestados", "PrestamosUsuario");
        comboReportes.getSelectionModel().selectFirst(); // Seleccionar el primer reporte por defecto
        manejarSeleccionReporte(); // Mostrar u ocultar los parámetros según el reporte seleccionado
    }

    @FXML
    private void manejarSeleccionReporte() {
        String seleccion = comboReportes.getValue();
        
        if ("PrestamosUsuario".equals(seleccion)) {
            parametrosBox.setVisible(true);  // Mostrar los parámetros
        } else {
            parametrosBox.setVisible(false); // Ocultar los parámetros
        }
    }

    @FXML
    private void generarReporte() {
        String seleccion = comboReportes.getValue();
        String reportePath = seleccion.equals("LibMasPrestados") ? "src/main/java/com/accesodatos/reports/reportviews/libMasPrestados.jasper" : "src/main/java/com/accesodatos/reports/reportviews/prestamosUsu.jasper";

        try {
            String url = "jdbc:mysql://localhost:3306/biblioteca";
            String usuario = "pomboadmin";
            String contraseña = "root";
            Connection conexion = DriverManager.getConnection(url, usuario, contraseña);
            HashMap<String, Object> parametros = new HashMap<>();

            if ("PrestamosUsuario".equals(seleccion)) {
                // Obtener valores de los campos y enviarlos como parámetros
                parametros.put("ID_USUARIO", Integer.parseInt(idUsuarioField.getText()));

                parametros.put("FECHA_INICIO", fechaInicioPicker.getValue() != null ?
                        Date.from(fechaInicioPicker.getValue().atStartOfDay(ZoneId.systemDefault()).toInstant()) : null);

                parametros.put("FECHA_FIN", fechaFinPicker.getValue() != null ?
                        Date.from(fechaFinPicker.getValue().atStartOfDay(ZoneId.systemDefault()).toInstant()) : null);
            }

            JasperReport reporte = (JasperReport) JRLoader.loadObjectFromFile(reportePath);

// Llenar el reporte con los parámetros y los datos
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametros, conexion);

            // Usar FileChooser para que el usuario seleccione dónde guardar el archivo
            FileChooser fileChooser = new FileChooser();
            fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PDF Files", "*.pdf"));
            fileChooser.setInitialFileName("reporte.pdf");
            File file = fileChooser.showSaveDialog(stage);

            if (file != null) {
                // Guardar el reporte en el archivo PDF seleccionado
                JasperExportManager.exportReportToPdfFile(jasperPrint, file.getAbsolutePath());
                System.out.println("Reporte guardado en: " + file.getAbsolutePath());
            }

        } catch (JRException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void setStage(Stage stage) {
        this.stage = stage;
    }
}
