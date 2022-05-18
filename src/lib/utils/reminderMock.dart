import 'package:uni/model/entities/reminder.dart';

class ReminderMock{
  static List<Reminder> getReminders(){
    return [
      Reminder(1, 201905589, 'SDInf', 'Não esquecer de ir tratar das justificações de falta',
          '2022-05-28 14:00'),
      Reminder(2, 201905589, 'STMA', 'Cacifos', '2022-05-30 15:00')
    ];
  }
}