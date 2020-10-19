package lab_darb1.model;

import java.awt.*;

/**
 * datubāzes grafiska objekta saglabāšanas modelis ar krāsām
 */
public class DbShape {

    private Shape shape;
    private Color fillColor;
    private Color borderColor;
    private boolean fill;

    public DbShape(Shape shape, Color fillColor, Color borderColor, boolean fill) {
        this.shape = shape;
        this.fillColor = fillColor;
        this.borderColor = borderColor;
        this.fill = fill;
    }

    public Shape getShape() {
        return shape;
    }

    public void setShape(Shape shape) {
        this.shape = shape;
    }

    public Color getFillColor() {
        return fillColor;
    }

    public void setFillColor(Color fillColor) {
        this.fillColor = fillColor;
    }

    public Color getBorderColor() {
        return borderColor;
    }

    public void setBorderColor(Color borderColor) {
        this.borderColor = borderColor;
    }

    public boolean isFill() {
        return fill;
    }

    public void setFill(boolean fill) {
        this.fill = fill;
    }
}
