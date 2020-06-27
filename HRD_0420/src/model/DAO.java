package model;

import java.sql.*;

public interface DAO {
	Connection getConnection() throws SQLException;
}
