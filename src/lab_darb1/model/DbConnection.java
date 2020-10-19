package lab_darb1.model;

import lab_darb1.model.constants.DbConnectionConstants;
import lab_darb1.model.exceptions.NotCorrectQueryFormatException;
import oracle.jdbc.driver.OracleDriver;
import oracle.spatial.geometry.JGeometry;
import oracle.sql.STRUCT;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static lab_darb1.model.constants.DbConnectionConstants.DB_URL;
import static lab_darb1.model.constants.DbConnectionConstants.PASSWORD;
import static lab_darb1.model.constants.DbConnectionConstants.USER;

// savienošanas ar datubāzes klase
public class DbConnection {

    Connection dbConnection;
    boolean connected = false;

    public DbConnection() {

    }

    public void init() {

        try {
            createConnection();
        } catch (ClassNotFoundException | SQLException exception) {
            connected = false;
        }

        connected = true;
    }

    private void createConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DbConnectionConstants.JDBC_DRIVER);
        DriverManager.registerDriver(new OracleDriver());
        dbConnection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        System.out.println("Savinošana ir veiksmīga.");
    }

    public boolean isConnected() {
        return connected;
    }

    // SELECT vaicājumā grafisko objektu atrāšana
    public List<JGeometry> findQueriedGeometries(String query) throws NotCorrectQueryFormatException, SQLException {
        // vaicājuma atrastas ģeometrijas saraksts
        List<JGeometry> jGeometries = new ArrayList<>();

        // vaicājuma pareizrakstības parbaudīšana
        String upperQuery = query.toUpperCase();
        if (upperQuery.indexOf("SELECT") != 0) {
            throw new NotCorrectQueryFormatException("SELECT nav atrasts vaicājumā sākumā!");
        }

        // vaicājuma palaišana
        PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();

        // vaicājuma rezultāta saglabāšana
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        int metaColumns = resultSetMetaData.getColumnCount();

        // vaicājuma rezultāta ģeometriska objekta atradīšana un saglabāšana
        STRUCT struct;
        JGeometry jGeometry;
        while (resultSet.next()) {
            int columns = metaColumns;

            while (columns > 0) {
                int type = resultSetMetaData.getColumnType(columns);

                if (type == Types.STRUCT) {
                    struct = (STRUCT) resultSet.getObject(columns);
                    jGeometry = JGeometry.load(struct);
                    jGeometries.add(jGeometry);
                }

                columns--;
            }
        }

        // ciet savienošanu ar datubāze
        resultSet.close();
        preparedStatement.close();

        return jGeometries;
    }
}
