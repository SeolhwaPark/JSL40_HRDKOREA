package model;

import java.sql.Connection;
import java.sql.SQLException;

public interface DBDAO {
	Connection getConnection() throws SQLException;
}
