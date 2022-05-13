import 'package:uni/model/entities/reminder.dart';

class ReminderMock{
  static List<Reminder> getReminders(){
    return [
      Reminder(1, 201905589, 'SDInf', 'Não esquecer de ir tratar das justificações de falta',
          '14:00 15/05/2022'),

      Reminder(2, 201905589, 'STMA', 'Cacifos', '15:00 15/05/2022')
    ];
  }
}