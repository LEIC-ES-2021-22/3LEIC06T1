import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class CalendarPicker extends StatelessWidget {
  final String myHour;

  CalendarPicker({
    this.myHour
  });

  /*DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2025, 6, 7),
        theme: DatePickerTheme(
        headerColor: Colors.lightBlueAccent,
        backgroundColor: Colors.white,
        itemStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18),
        doneStyle:
        TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {
        print('change $date in time zone ' +
        date.timeZoneOffset.inHours.toString());
        }, onConfirm: (date) {
        print('confirm $date');
  }, currentTime: DateTime.now(), locale: LocaleType.en);*/
}