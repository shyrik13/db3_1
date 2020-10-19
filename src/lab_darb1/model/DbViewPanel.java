package lab_darb1.model;

import lab_darb1.model.constants.ColorConstants;
import lab_darb1.model.constants.DbWindowConstants;
import lab_darb1.model.constants.QueryConstants;
import lab_darb1.model.exceptions.NotCorrectQueryFormatException;
import oracle.spatial.geometry.JGeometry;

import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * datubāzes ģeometrijas vizualizēšana klase
 */
public class DbViewPanel extends JPanel {

    private List<DbShape> dbShapes = new ArrayList<>();
    private List<Shape> shapes = new ArrayList<>();
    private AffineTransform affineTransform = AffineTransform.getScaleInstance(16, 16);

    public DbViewPanel() {

    }

    public void setDbShapes(List<JGeometry> jGeometries, Color fillColor, Color borderColor, boolean fill) {
        for (JGeometry jGeometry : jGeometries) {
            this.dbShapes.add(new DbShape(jGeometry.createShape(this.affineTransform), fillColor, borderColor, fill));
        }
    }

    public void setShapes(List<JGeometry> jGeometries) {
        clearShapes();
        for (JGeometry jGeometry : jGeometries) {
            this.shapes.add(jGeometry.createShape(this.affineTransform));
        }
    }

    public void clearShapes() {
        this.shapes.clear();
    }

    public void draw() {
        paint(this.getGraphics());
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D graphics2D = (Graphics2D) g;
        graphics2D.setStroke(new BasicStroke(4));

        graphics2D.translate(getWidth() / 4, getHeight());
        graphics2D.scale(DbWindowConstants.SCALE_X, DbWindowConstants.SCALE_Y);

        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
        graphics2D.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);

        for (DbShape dbShape : dbShapes) {
            graphics2D.setColor(dbShape.getBorderColor());
            graphics2D.draw(dbShape.getShape());

            if (dbShape.isFill()) {
                graphics2D.setColor(dbShape.getBorderColor());
                graphics2D.fill(dbShape.getShape());
            }
        }

        graphics2D.setColor(ColorConstants.BORDER);
        graphics2D.setStroke(new BasicStroke(4));

        for (Shape shape : shapes) {
            graphics2D.draw(shape);
        }

        graphics2D.setColor(Color.BLACK);
        graphics2D.setStroke(new BasicStroke(1));
    }

    public void initDefaultView(DbConnection dbConnection) throws SQLException, NotCorrectQueryFormatException {

        // pievienot nebistamas GEO_SLANIS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.GEO_SLANIS_NAV_BISTAMS),
                ColorConstants.GEO_SLANIS_NAV_BISTAMS,
                ColorConstants.GEO_SLANIS_NAV_BISTAMS,
                true
        );

        // pievienot viduvēji bistamas GEO_SLANIS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.GEO_SLANIS_VID_BISTAMS),
                ColorConstants.GEO_SLANIS_VID_BISTAMS,
                ColorConstants.GEO_SLANIS_VID_BISTAMS,
                true
        );

        // pievienot bistamas GEO_SLANIS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.GEO_SLANIS_BISTAMS),
                ColorConstants.GEO_SLANIS_BISTAMS,
                ColorConstants.GEO_SLANIS_BISTAMS,
                true
        );

        // pievienot GRUNTSUDENS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.GRUNTSUDENS),
                ColorConstants.GRUNTSUDENS,
                ColorConstants.GRUNTSUDENS,
                true
        );

        // pievienot CELAS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.CELAS),
                ColorConstants.CELAS,
                ColorConstants.CELAS,
                true
        );

        // pievienot NOLIKTAVAS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.NOLIKTAVAS),
                ColorConstants.NOLIKTAVAS,
                ColorConstants.NOLIKTAVAS,
                true
        );

        // pievienot PETNIEKU_CENTRS
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.PETNIEKU_CENTRS),
                ColorConstants.PETNIEKU_CENTRS,
                ColorConstants.PETNIEKU_CENTRS,
                true
        );

        // pievienot DARBA_MASINA
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.DARBA_MASINA),
                ColorConstants.DARBA_MASINA,
                ColorConstants.DARBA_MASINA,
                true
        );

        // pievienot IERICE
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.IERICE),
                ColorConstants.IERICE,
                ColorConstants.IERICE,
                true
        );

        // pievienot RUDAS_VIETA
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.RUDAS_VIETA),
                ColorConstants.RUDAS_VIETA,
                ColorConstants.RUDAS_VIETA,
                true
        );

        // pievienot NEMETAL_MINERAL_VIETA
        this.setDbShapes(
                dbConnection.findQueriedGeometries(QueryConstants.NEMETAL_MINERAL_VIETA),
                ColorConstants.NEMETAL_MINERAL_VIETA,
                ColorConstants.NEMETAL_MINERAL_VIETA,
                true
        );

        this.draw();
    }
}
