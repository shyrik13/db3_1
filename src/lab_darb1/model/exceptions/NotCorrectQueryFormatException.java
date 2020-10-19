package lab_darb1.model.exceptions;

// nepareiza vaicājuma formāta kļūdas izņēmums
public class NotCorrectQueryFormatException extends Exception {

    public NotCorrectQueryFormatException() {
    }

    public NotCorrectQueryFormatException(String message) {
        super(message);
    }
}
