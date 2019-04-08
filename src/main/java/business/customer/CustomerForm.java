package business.customer;

import java.util.Calendar;
import java.util.Date;

import static java.lang.Integer.parseInt;
import static java.lang.System.out;

public class CustomerForm {

    private String name;
    private String address;
    private String phone;
    private String email;
    private String ccNumber;
    private String monthString;
    private String yearString;

    private Date ccExpDate;

    private boolean hasNameError;
    private boolean hasAddressError;
    private boolean hasPhoneError;
    private boolean hasEmailError;
    private boolean hasCcNumberError;

    public CustomerForm() { this("", "", "", "", "", "","");}

    public CustomerForm(String name, String address, String phone, String email, String ccNumber, String ccMonth, String ccYear) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.ccNumber = ccNumber;
        this.monthString = ccMonth;
        this.yearString = ccYear;
        this.ccExpDate = getCcExpDate(monthString, yearString);
        validate();
    }

    // Get methods for fields

    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getPhone() { return phone; }
    public String getEmail() { return email; }
    public String getCcNumber() { return ccNumber; }
    public String getCcMonth() { return monthString; }
    public String getCcYear() { return yearString; }
    public Date getCcExpDate() { return ccExpDate; }

    // hasError methods for fields

    public boolean getHasNameError() { return hasNameError; }
    public boolean getHasAddressError() { return hasAddressError; }
    public boolean getHasPhoneError() { return hasPhoneError; }
    public boolean getHasEmailError() { return hasEmailError; }
    public boolean getHasCcNumberError() { return hasCcNumberError; }

    public boolean getHasFieldError() {
        return hasNameError || hasAddressError || hasPhoneError || hasEmailError || hasCcNumberError;
    }

    // error messages for fields

    public String getNameErrorMessage() { return "Valid name required (ex: Bilbo Baggins)"; }
    public String getAddressErrorMessage() { return "Valid US address required"; }
    public String getPhoneErrorMessage() { return "Valid 10-digit phone number required"; }
    public String getEmailErrorMessage() { return "Valid email required (ex: example@example.com"; }
    public String getCcNumberErrorMessage() { return "Valid 14-16 digit credit card number required"; }

    private void validate() {
        if (name == null || name.equals("") || name.length() > 45) {
            hasNameError = true;
        }

        if (address == null || address.equals("") || address.length() > 45) {
            hasAddressError = true;
        }

        String digitOnlyPhone = (phone == null) ? "" : phone.replaceAll("[^0-9]","");
        if (phone.equals("") || digitOnlyPhone.length() != 10) {
            hasPhoneError = true;
        }

        if (email == null || email.contains(" ") || !email.contains("@") || email.endsWith(".")) {
            hasEmailError = true;
        }
        String digitOnlyCcNumber = (ccNumber == null) ? "" : ccNumber.replaceAll("[^0-9]","");
        if (ccNumber.equals("") || !(13 < digitOnlyCcNumber.length() && digitOnlyCcNumber.length() < 17)) {
            hasCcNumberError = true;
        }
    }

    // Returns a Java date object with the specified month and year
    public Date getCcExpDate(String monthString, String yearString) {
        // Assume monthString is an integer between 1 and 12
        if (!monthString.isEmpty() || !yearString.isEmpty()) {
            //Subtract one here because calendar object months are indexed from 0-11
            int ccMonth = (parseInt(monthString) - 1);
            int ccYear = parseInt(yearString);
            out.println("ccMonth:" + ccMonth);
            out.println("ccYear:" + ccYear);
            Calendar calendar = Calendar.getInstance();
            calendar.clear();
            calendar.set(Calendar.MONTH, ccMonth);
            calendar.set(Calendar.YEAR, ccYear);
            Date date = calendar.getTime();
            out.println("ccExpDate:" + date);
            return date;
        } else {
            return null;
        }
        // Assume yearString is a four-digit integer

        // Note: Calendar.getInstance() returns a calendar object
        // Note: calendar.set(Calendar.MONTH, mm) sets the month
        // Note: calendar.set(Calendar.YEAR, yyyy) sets the year
        // Note: Be careful of one-off errors
    }
}
