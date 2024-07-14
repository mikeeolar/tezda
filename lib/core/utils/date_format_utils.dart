import 'package:intl/intl.dart';

class DateFormatUtil {
  DateFormatUtil._();

  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');
  static final chartFormat = DateFormat('dd-MMM-yy');
  static final dddashmmdashyyyy = DateFormat('dd-MM-yyyy');
  static final timeFormat = DateFormat('hh:mm a');
  static final dateMonthTimeFormat = DateFormat('dd MMM, hh:mm a');
  static final dayMonthFormat = DateFormat('E MMM dd, yyyy');
  static final dayFormat = DateFormat('E');
  static final yyyymmddTime = DateFormat('yyyy-MM-dd hh:mm a');
  static final yyyymmdd = DateFormat('yyyy-MM-dd');
  static final ddmmyyyy2 = DateFormat('yyyy-MM-dd');
  static final ddmmyyyy = DateFormat('dd/MM/yyyy');
  static final mmmddyyy = DateFormat('dd MMM, yyyy');
  static final mmyyyy = DateFormat('MM/yyyy');
  static final mMMyyyy = DateFormat('MMM yyyy');
  static final mMMMyyyy = DateFormat('MMMM yyyy');

  static String formatDate(String date) =>
      DateFormat('MMM dd, yyyy. hh:mm a').format(DateTime.parse(date));

  static String mDY(String date) =>
      DateFormat('MMM d, y').format(DateTime.parse(date));

  static String loanTime(String date) =>
      DateFormat('h:mm a').format(DateTime.parse(date));

  static String formatTransactionDate(String date) =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

  static String formatTransactionDateTime(String date) =>
      DateFormat('yyyy-MM-dd h:mm a').format(DateTime.parse(date));

}