// import 'dart:developer';
// import 'dart:math' as math;

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class FcmConfig {
//   //************  Firebase configruation  ************

//   // onBackgroundMessage is used to show a message while app in terminated state or background state using local notification pkg
//   static Future<void> messageHandler(RemoteMessage message) async {
//     // print("messagee ${message.toString()}");
//     // print("data ${message.data}");
//     // print("notificationBody ${message.notification!.body}");
//   }

// //here we put our logic to navigate using global key to specific screen when user press on the notification
//   static void _handleMessage(RemoteMessage message) {
//     // print("message ${message}");
//     // print("data ${message.data}");
//     // print("notification ${message.notification}")
//   }

//   static Future<void> setupInteractedMessage() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

// // onMessage does respond to data notifications while app in  foreground state
//     FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
//       // print("onMessage");
//       // print(event.notification!.body.toString());
//       // print(event.data.toString());
//       if (event.notification != null) {
//         log('Message also contained a notification: ${event.notification}');
//         //onPress for this notification will be handled inside inboxNotificationAction method in local notification config file
//         AwesomeNotifications().createNotification(
//             content: NotificationContent(
//           //id must be unique in case of we have old notifcation with same id with new one..new one won't appear to the user
//           id: math.Random().nextInt(10000),
//           channelKey: 'inbox',
//           title: event.data["title"],
//           body: event.data["body"],
//           payload: {
//             'news_id': event.data['news_id'],
//           },
//           category: NotificationCategory.Message,
//         ));
//       }
//     });
//     //onMessageOpenedApp triggered when user press on notifcation from any state except termintaed state
//     // onMessageOpenedApp doesn't trigger at all for all data messages(silent message) in any scenario
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       _handleMessage(message);
//     });
//     // Get any messages which caused the application to open from a terminated state.
//     RemoteMessage? initialMessage = await messaging.getInitialMessage();
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//   }

//   static Future<String?> getFcmToken() async {
//     return await FirebaseMessaging.instance.getToken();
//   }
// }
