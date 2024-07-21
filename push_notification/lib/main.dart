import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/api/firebase_api.dart';
import 'package:push_notification/firebase_options.dart';
import 'package:push_notification/home.dart';
import 'package:push_notification/notification_screen.dart';

//The state for a [Navigator] widget.
final naviKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initalizing app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //calling our api's notification method here
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      //key
      navigatorKey: naviKey,
      //routes
      routes: {
        '/notification_screen': (context) => const NotificationScreen(),
      },
    );
  }
}
