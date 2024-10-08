// import 'package:awesome_notifications/awesome_notifications.dart';

// import 'package:flutter/material.dart';

// class LocalNotifcationsConfig {
//   static Future<void> initializeLocalNotifications() async {
//     await AwesomeNotifications().initialize(
//       //TODO: replace null with a desired icon
//       null,
//       // 'resource://drawable/notification_icon',

//       [
//         NotificationChannel(
//           channelGroupKey: 'inbox_category',
//           channelKey: 'inbox',
//           channelName: 'inbox',
//           channelDescription: 'inbox Channel',
//           importance: NotificationImportance.Max,
//           ledColor: Colors.white,
//           channelShowBadge: false,
//           locked: true,
//           defaultRingtoneType: DefaultRingtoneType.Notification,
//         ),
//       ],
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupKey: 'inbox_category', channelGroupName: 'inbox category'),
//       ],
//       debug: true,
//     );
//   }

//   static Future<void> initializeNotificationsEventListeners() async {
//     // Only after at least the action method is set, the notification events are delivered
//     AwesomeNotifications().setListeners(
//         onActionReceivedMethod: LocalNotifcationsConfig.onActionReceivedMethod,
//         onNotificationCreatedMethod: LocalNotifcationsConfig.onNotificationCreatedMethod,
//         onNotificationDisplayedMethod:
//             LocalNotifcationsConfig.onNotificationDisplayedMethod,
//         onDismissActionReceivedMethod:
//             LocalNotifcationsConfig.onDismissActionReceivedMethod);
//   }

//   /// Use this method to detect when a new notification or a schedule is created
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {}

//   /// Use this method to detect every time that a new notification is displayed
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {}

//   /// Use this method to detect if the user dismissed a notification
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction receivedAction) async {}

//   /// Use this method to detect when the user taps on a notification or action button
//   static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
//     // Always ensure that all plugins was initialized
//     WidgetsFlutterBinding.ensureInitialized();

//     bool isSilentAction = receivedAction.actionType == ActionType.SilentAction;

//     // SilentBackgroundAction runs on background thread and cannot show
//     // UI/visual elements
//     if (receivedAction.actionType != ActionType.SilentBackgroundAction) {
//       switch (receivedAction.channelKey) {
//         case 'inbox':
//           await inboxNotificationAction(receivedAction);
//           break;

//         default:
//           if (isSilentAction) {
//             break;
//           }
//       }
//     }
//   }

//   static Future<void> inboxNotificationAction(ReceivedAction receivedAction) async {
//     //navigate to specific screen using globalKey here
//     // print(receivedAction.payload);
//     // print(receivedAction.body);
//     // print(receivedAction.id);
//   }
// }
