import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/main.dart';

class FirebaseApi {
  //create instance of firebase messaging
  final firebaseMessaging = FirebaseMessaging.instance;

  //function to initalize notification
  Future<void> initNotification() async {
    //prompt user to allow notification
    await firebaseMessaging.requestPermission();

    //fetch the FCM token (firebase cloud messaging)
    final fCMToken = await firebaseMessaging.getToken();

    //print token
    debugPrint("token:  $fCMToken");

    //initalize for further push notification
    initPushNotification();
  }

  //function to handel recevied notification
  void handleNoti(RemoteMessage? message) {
    //if message is null
    if (message == null) return;
    //if having data navigate to noti screen when click on notification
    naviKey.currentState!.pushNamed('/notification_screen', arguments: message);
  }

  //function to initalize forground and background settings
  Future initPushNotification() async {
    //handle the notification if the app is terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleNoti);

    //add event listener when notification opens app
    FirebaseMessaging.onMessageOpenedApp.listen(handleNoti);
  }
}
