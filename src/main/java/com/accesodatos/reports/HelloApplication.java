package com.accesodatos.reports;

import com.accesodatos.reports.controllers.MainController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.io.IOException;
import java.util.Objects;

public class HelloApplication extends Application {
    @Override
    public void start(Stage stage) throws Exception {
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("hello-view.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 573, 478);
        stage.getIcons().add(new Image(Objects.requireNonNull(getClass().getResourceAsStream("/icono.png"))));
        stage.setTitle("Biblioteca Arrullo");

        // Hacer que la ventana no sea redimensionable
        stage.setResizable(false);  // Evitar que la ventana sea redimensionable

        // Establecer la referencia del Stage en el controlador
        MainController controller = fxmlLoader.getController();
        controller.setStage(stage);

        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}