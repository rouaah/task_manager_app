import 'package:easy_localization/easy_localization.dart';
import 'package:intl/date_symbol_data_local.dart';

DateTime responseDateFormat(String incomingServerDate) {
  initializeDateFormatting();
  var dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(incomingServerDate, true);
  var dateLocal = dateTime.toLocal();
  return dateLocal;
}

String responseDateAsString(String incomingServerDate,
    {String pattern = "yyyy-MM-dd hh:mm a", String locale = "en"}) {
  initializeDateFormatting();
  var localTime =
      DateFormat("yyyy-MM-dd HH:mm", "en").parse(incomingServerDate, true).toLocal();
  var formattedDate = DateFormat(pattern, locale).format(localTime);
  return formattedDate;
}

// DateTime responseDateFormatWithoutUtc(String incomingServerDate) {
//   initializeDateFormatting();
//   var dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(incomingServerDate, true);
//   return dateTime;
// }

String requestDateFormat(DateTime date) {
  initializeDateFormatting();
  var utcDate = date.toUtc();
  var formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(utcDate);
  return formattedDate;
}

String requestDateFormatWithoutUtc(DateTime date) {
  initializeDateFormatting();
  var formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate;
}

// Define a function that takes a UTC date and time string as input
// and returns a local date and time string as output
String convertUTCToLocal(String utcString, String pattern) {
  // Parse the input string as a UTC DateTime object
  DateTime utcDate = DateTime.parse(utcString).toUtc();

// Convert the UTC DateTime object to a local DateTime object
  DateTime localDate = utcDate.toLocal();

// Format the local DateTime object as a string
// You can customize the format according to your preference
  // String localString = DateFormat('EEEE d MMMM yyyy - hh:mm a').format(localDate);
  String localString = DateFormat(pattern).format(localDate);

// Return the local date and time string
  return localString;
}
///////////////////////////////////////////////////
