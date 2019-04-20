import 'package:intl/intl.dart';

String dateDisplay(date) {
  final weekdays = ['Monday','Tuesday','Wednesday', 'Thursday','Friday', 'Saturday', 'Sunday'];
  final months = ['January','February','March', 'April','May', 'June', 'July','August','September', 'October', 'November', 'December'];
  String formattedDate="";
  DateTime today = DateTime.now();
  if (date.day == today.day &&
      date.month == today.month &&
      date.year == today.year) {
    String time = DateFormat('kk:mm').format(date);
    formattedDate = 'Today at $time';
  } else {
    String time= DateFormat('kk:mm').format(date);
    formattedDate = '${weekdays[date.weekday-1]}, ${date.day}th, ${months[date.month-1]} at $time';
  }

  return formattedDate;
}
