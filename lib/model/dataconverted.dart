import 'package:intl/intl.dart';

class DataConverted {
  static String getTime(int time) {
    switch (time) {
      case 0:
        return "9:00 AM";
      case 1:
        return "10:00 AM";
      case 2:
        return "11:00 AM";
      case 3:
        return "12:00 PM";
      case 4:
        return "13:30 PM";
      case 5:
        return "14:30 PM";
      case 6:
        return "15:30 PM";
      case 7:
        return "16:30 PM";
      case 8:
        return "17:30 PM";
      case 9:
        return "18:30 PM";
      default:
        return "16:00 PM";
    }
  }
}
