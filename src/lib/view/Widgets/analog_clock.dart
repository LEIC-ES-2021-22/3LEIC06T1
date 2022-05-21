import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter/widgets.dart';


TimeOfDay selectedTime = TimeOfDay.now();

_selectTime(BuildContext context) async {
  final TimeOfDay timeOfDay = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    initialEntryMode: TimePickerEntryMode.dial,
  );
  if(timeOfDay != null && timeOfDay != selectedTime)
  {
    selectedTime = timeOfDay;
  }
}

class ClockDemo extends StatelessWidget {
  final String myHour;

  ClockDemo({
    this.myHour
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _selectTime(context),
          child:
            FlutterAnalogClock(
                dateTime: DateTime.parse(myHour),
                dialPlateColor: Colors.white,
                hourHandColor: Colors.black,
                minuteHandColor: Colors.black,
                secondHandColor: Colors.black,
                numberColor: Colors.black,
                borderColor: Colors.black,
                tickColor: Colors.black,
                centerPointColor: Colors.black,
                showBorder: true,
                showTicks: true,
                showMinuteHand: true,
                showSecondHand: true,
                showNumber: true,
                borderWidth: 8.0,
                hourNumberScale: .10,
                hourNumbers: ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'],
                isLive: false,
                width: 150.0,
                height: 150.0,
                decoration: const BoxDecoration(),
        ),
    );
  }
}