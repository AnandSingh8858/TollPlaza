package com.tollplaza.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	private Connection con = null;

	{
		try {
            Class.forName("org.gjt.mm.mysql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("Could not load database driver. Exiting..");
			System.exit(-1);
		}

	}

	public Connection getConnection() {
		if (con != null) {
			return con;
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TollApp", "root", "8858");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;

	}
}
