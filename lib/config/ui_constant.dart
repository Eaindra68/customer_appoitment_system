import 'package:intl/intl.dart';

class UIConstants {
  static const double horizontalPadding = 16.0;

  static final dateFormat = DateFormat('dd/MMM/yyyy');
  static final datetimeFormat = DateFormat('dd/MMM/yyyy h:mm a');

  static final orderTimeFormat = DateFormat('dd MMM h:mm a');
  static final timeFormat = DateFormat('h:mm a');
  static final nearDateFormat = DateFormat(r"E, MMM d");
  static final nearDateTimeFormat = DateFormat(r"E, MMM d h:mm a");
}
