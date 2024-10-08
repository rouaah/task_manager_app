import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/core/databases/config_db.dart';
import 'package:task_manager_app/core/helpers/bloc_observer.dart';
import 'package:task_manager_app/core/utils/easy_loading_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager_app/task_manager_app.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await LocalNotifcationsConfig.initializeLocalNotifications();
  // FirebaseMessaging.onBackgroundMessage(FcmConfig.messageHandler);
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await ConfigDB().initDB();
  Bloc.observer = AppBlocObserver();
  runApp(EasyLocalization(
    // list of locals which app support
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    // fallbackLocale is the Locale when the locale is not in the lis
    fallbackLocale: const Locale('en'),
    // startLocale to override device locale
    startLocale: const Locale('en'),
    // to save local in device storage
    saveLocale: true,
    child: const TaskManagerApp(),
  ));
  EasyLoadingConfig.config();
}
