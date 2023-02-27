class FieldValidator {
  static String? emailValidator(String? textFieldValue) {
    if (textFieldValue == null || textFieldValue.isEmpty) {
      return 'This value is required';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(textFieldValue)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? phoneNumValidator(String? textFieldValue) {
    if (textFieldValue == null || textFieldValue.isEmpty) {
      return 'This value is required';
    } else if (!RegExp(r"^(?:\+254|254|0)((1|7)(?:(?:[0-9][0-9])|(?:[0-9][0-9][0-9]))[0-9]{6})$")
        .hasMatch(textFieldValue)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? passFieldValue) {
    if (passFieldValue == null || passFieldValue.isEmpty) {
      return 'This field must contain a value';
    } else if (passFieldValue.length <= 8) {
      return 'Password must contain more than 8 characters';
    } else {
      return null;
    }
  }

  static String? textValidator(String? textFieldValue) {
    if (textFieldValue == null || textFieldValue.isEmpty) {
      return 'This field must contain a value';
    } else {
      return null;
    }
  }

  // * validators
// * registration number (([A-Z]{1,2})([0-9]{2})+\/([0-9]{5})+\/([0-9]{2}))
// * phone number check this link for a variety https://felixrunye.medium.com/kenyan-phone-numbers-regex-ce283289943d
// * email address ^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+
// todo: use this validators in a separate module and test it! Basis for Unit Testing talk @ Tech Friday
}
