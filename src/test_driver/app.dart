import 'package:provider/provider.dart';
import 'package:uni/controller/reminder_controller.dart';

import '../lib/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  runApp(
      MultiProvider(
        providers: [
          Provider<NotificationService>(
            create: (context) => NotificationService(),
          )
        ],
        child: MyApp(),
      ));
}