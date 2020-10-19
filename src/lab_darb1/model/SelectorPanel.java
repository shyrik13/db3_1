package lab_darb1.model;

import lab_darb1.model.constants.DbWindowConstants;
import lab_darb1.model.constants.QueryConstants;
import lab_darb1.model.exceptions.NotCorrectQueryFormatException;
import oracle.spatial.geometry.JGeometry;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.sql.SQLException;
import java.util.List;

// objketa izvēlēšanas panelis klase
public class SelectorPanel extends JPanel {

    private Rectangle selector = null;
    Point start = null;

    private DbConnection dbConnection;
    private DbViewPanel dbViewPanel;

    public SelectorPanel(DbConnection dbConnection, DbViewPanel dbViewPanel) {

        this.dbConnection = dbConnection;
        this.dbViewPanel = dbViewPanel;

        this.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (start == null) {
                    start = new Point();
                    start = e.getPoint();
                } else {
                    Point end = e.getPoint();
                    translateIntoDbCoordsAndSelect(start, end);
                    start = null;
                }
            }
        });

        this.addMouseMotionListener(new MouseMotionAdapter() {
            @Override
            public void mouseMoved(MouseEvent e) {
                if (start != null) {
                    Point end = e.getPoint();
                    selector = new Rectangle(start,
                            new Dimension(end.x-start.x, end.y-start.y));
                    repaint(selector);
                    draw();
                }
            }
        });
    }

    public void translateIntoDbCoordsAndSelect(Point start, Point end) {

        double kx = (double) dbViewPanel.getWidth() / 100;
        double ky = (double) dbViewPanel.getHeight() / 100;

        double startXC = ((double) start.x / kx) * DbWindowConstants.SCALE_X;
        double startYC = 100 - (start.y / ky);
        double endXC = ((double) end.x / kx) * DbWindowConstants.SCALE_X;
        double endYC = 100 - (end.y / ky);

        String ordinateArray = String.format(
                "MDSYS.SDO_ORDINATE_ARRAY(%.2f,%.2f, %.2f,%.2f, %.2f,%.2f, %.2f,%.2f, %.2f,%.2f)",
                startXC, startYC, endXC, startYC, endXC, endYC, startXC, endYC, startXC, startYC
        );

        for (String table : QueryConstants.TABLES) {
            String query = QueryConstants.selectorQueryBuilder(ordinateArray, table);

            try {
                List<JGeometry> jGeometryList = dbConnection.findQueriedGeometries(query);
                if (!jGeometryList.isEmpty()) {
                    dbViewPanel.setShapes(jGeometryList);
                }
            } catch (NotCorrectQueryFormatException | SQLException notCorrectQueryFormatException) {
                notCorrectQueryFormatException.printStackTrace();
            }
        }

        dbViewPanel.draw();
        dbViewPanel.clearShapes();
    }

    public void draw() {
        paint(this.getGraphics());
    }

    @Override
    protected void paintComponent(Graphics g) {
        g.setColor(getBackground());
        super.paintComponent(g);
        Graphics2D graphics2D = (Graphics2D) this.getGraphics();
        graphics2D.setStroke(new BasicStroke(2));

        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
        graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);

        if (selector != null) {
            graphics2D.setColor(Color.BLACK);
            graphics2D.draw(selector);
        }
    }
}
