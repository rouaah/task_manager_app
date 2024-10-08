import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_manager_app/app/features/auth/logic/cubit/authentication_cubit.dart';
import 'package:task_manager_app/app_wrapper.dart';
import 'package:task_manager_app/core/di/dependencies.dart';
import 'package:task_manager_app/core/extensions/context_shortcuts.dart';
import 'package:task_manager_app/core/routes/app_router.dart';
import 'package:task_manager_app/core/routes/routes.dart';
import 'package:task_manager_app/core/styles/style.dart';
import 'package:task_manager_app/main.dart';

import 'core/utils/easy_loading_config.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  void initState() {
    // LocalNotifcationsConfig.initializeNotificationsEventListeners();
    // FcmConfig.setupInteractedMessage();
    // FirebaseMessaging.instance.requestPermission();
    Dependencies.registerRepos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthenticationCubit>()),
      ],
      child: ResponsiveSizer(builder: (context, orientation, deviceType) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationLoggingOut) {
                Loader.dismiss();
                navigatorKey.currentState!.context.goUntil(Routes.homeScreen);
              }
              if (state is AuthenticationAuthenticated) {
                Loader.dismiss();
              }
            },
            child: MaterialApp(
              title: 'Tobsir',
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              builder: EasyLoading.init(),
              home: const AppWrapper(),
              theme: appTheme(context.locale),
              onGenerateRoute: AppRouter.generateRoute,
              navigatorObservers: [routeObserver],
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            ),
          ),
        );
      }),
    );
  }
}
