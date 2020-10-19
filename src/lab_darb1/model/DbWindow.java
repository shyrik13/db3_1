package lab_darb1.model;

import lab_darb1.model.exceptions.NotCorrectQueryFormatException;
import oracle.spatial.geometry.JGeometry;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.List;

import static lab_darb1.model.constants.DbWindowConstants.WINDOW_HEIGHT;
import static lab_darb1.model.constants.DbWindowConstants.WINDOW_WIDTH;

// programmas loga klase
public class DbWindow extends JFrame implements ActionListener {

    private final int width;
    private final int height;

    private DbConnection dbConnection;

    private JButton exitButton;
    private JButton queryCompileButton;

    private JTextArea queryTextArea;

    private DbViewPanel dbViewPanel;
    private SelectorPanel selectorPanel;

    public DbWindow() {
        this.width = WINDOW_WIDTH;
        this.height = WINDOW_HEIGHT;
    }

    public void init() {

        // savienošanas klase izveidošana
        this.dbConnection = new DbConnection();
        // savienošanas izveidošana
        dbConnection.init();

        // jā nav savienošana, tad izejam no programmas
        if (!dbConnection.isConnected()) {
            System.exit(1);
        }

        // izveidot logu
        initWindow();

        try {
            dbViewPanel.initDefaultView(dbConnection);
        } catch (SQLException | NotCorrectQueryFormatException throwables) {
            throwables.printStackTrace();
        }

    }

    private void initWindow() {
        dbViewPanel = new DbViewPanel();
        selectorPanel = new SelectorPanel(dbConnection, dbViewPanel);
        queryTextArea = new JTextArea();
        queryCompileButton = new JButton("Palaist vaicājumu");
        exitButton = new JButton("Beigt darbu");

        setTitle("Aleksandrs Koroļko (Lab darbs 1)");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(this.width, this.height);

        int panelWidth = this.width - (int) ((double) this.width * 0.1);
        int panelHeight = this.height - (int) ((double) this.height * 0.1);
        dbViewPanel.setPreferredSize(new Dimension(panelWidth, panelHeight));
        selectorPanel.setPreferredSize(new Dimension(panelWidth, panelHeight));
        selectorPanel.setOpaque(false);
        selectorPanel.setBackground(new Color(0, 0,0, 0));

        queryCompileButton.addActionListener(this);
        exitButton.addActionListener(e -> System.exit(0));

        dbViewPanel.setComponentZOrder(selectorPanel, 0);
        add(dbViewPanel);
        add(queryTextArea);
        add(queryCompileButton);
        add(exitButton);

        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        try {
            List<JGeometry> jGeometryList = dbConnection.findQueriedGeometries(queryTextArea.getText());

            if (!jGeometryList.isEmpty()) {
                dbViewPanel.setShapes(jGeometryList);
            } else {
                System.out.println("Nebija atrastas ģeometriskie objekti");
                dbViewPanel.clearShapes();
            }
            dbViewPanel.draw();
        } catch (NotCorrectQueryFormatException | SQLException notCorrectQueryFormatException) {
            notCorrectQueryFormatException.printStackTrace();
        }

    }
}
