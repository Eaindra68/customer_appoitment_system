import 'phone_number_validator.dart';

class Validations {
  static String? nonEmptyValue(String? value) {
    value = value?.trim().replaceAll(RegExp(r'\s+'), '');

    if (value?.isNotEmpty != true) return "Field can't empty!";
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    value = value?.trim().replaceAll(RegExp(r'\s+'), '');
    if (value?.isNotEmpty != true) return "Phone number is empty";

    final phoneNumber = '09$value';
    final isValid = PhoneNumberValidator.isValidMMPhoneNumber(phoneNumber);
    if (!isValid) return "Invalid Phone Number";

    return null;
  }
}
