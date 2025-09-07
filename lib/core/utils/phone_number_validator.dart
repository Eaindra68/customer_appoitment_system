class PhoneNumberValidator {
  static bool isValidMMPhoneNumber(String phoneNumber) {
    var number = sanitizeNumber(phoneNumber: phoneNumber);
    var mmPhoneRegex = r'^(09|\+?950?9|\+?95950?9)\d{7,9}$';
    return validate(number, mmPhoneRegex);
  }

  static String sanitizeNumber({required String phoneNumber}) {
    var number = phoneNumber.trim();
    number = number.replaceAll(" ", "");
    number = number.replaceAll("-", "");

    var countryCodeRegex = r'^\+?950?9\d+$';
    if (validate(number, countryCodeRegex)) {
      var doubleCountryCodeRegex = r"^\+?95950?9\d{7,9}$";
      if (validate(number, doubleCountryCodeRegex)) {
        number = number.stringByReplacingFirstOccurrenceOfString(
          target: "9595",
          withString: "95",
        );
      }

      var zeroBeforeAreaCodeRegex = r"^\+?9509\d{7,9}$";
      if (validate(number, zeroBeforeAreaCodeRegex)) {
        number = number.stringByReplacingFirstOccurrenceOfString(
          target: "9509",
          withString: "959",
        );
      }
    }
    return number;
  }

  static bool validate(String input, String source) {
    var regex = RegExp(source, caseSensitive: false);
    return regex.hasMatch(input);
  }
}

extension Helper on String {
  String stringByReplacingFirstOccurrenceOfString({
    required String target,
    required String withString,
  }) {
    return replaceFirst(target, withString);
  }
}
