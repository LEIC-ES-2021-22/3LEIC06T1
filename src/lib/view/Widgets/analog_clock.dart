import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter/widgets.dart';



class ClockDemo extends StatelessWidget {
  TimeOfDay selectedTime;

  ClockDemo(DateTime initDateTime){
    selectedTime = TimeOfDay.fromDateTime(initDateTime);
  }


  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      selectedTime = timeOfDay;
      print(timeOfDay);
    }
  }

  getSelectedTimeOfDay(){
    return selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _selectTime(context),
        child:
        Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterAnalogClock(
                dateTime: DateTime.parse('2022-05-30 11:00'),
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
              const SizedBox(height: 20),
              Text(selectedTime.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme
                        .of(context)
                        .accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
              ),
              const SizedBox(height: 20),
            ]
        )
    );
  }
}