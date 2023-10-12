import 'package:intl/intl.dart';

class FormatNumber {
  static String formatPrice(number) {
    if (number == 0) {
      return "0 đ";
    } else {
      var formatter = NumberFormat('###,000');
      return "${formatter.format(number)} đ";
    }
  }
}
