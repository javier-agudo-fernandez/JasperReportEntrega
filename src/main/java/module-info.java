module com.accesodatos.reports {
    requires javafx.controls;
    requires javafx.fxml;
    requires net.sf.jasperreports.core;
    requires org.mariadb.jdbc;
    requires org.slf4j;
    requires java.desktop;


    opens com.accesodatos.reports to javafx.fxml;
    exports com.accesodatos.reports;
    exports com.accesodatos.reports.controllers;
    opens com.accesodatos.reports.controllers to javafx.fxml;
}