import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager_app/app/features/auth/logic/cubit/authentication_cubit.dart';
import 'package:task_manager_app/app/features/auth/ui/failure_screen.dart';
import 'package:task_manager_app/app/features/splash_screen.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/widgets/loading_widget.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  AppWrapperState createState() => AppWrapperState();
}

class AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUninitialized) {
          return const SplashScreen();
        } else if (state is AuthenticationLoading) {
          return const LoadingWidget();
        } else if (state is AuthenticationAuthenticated ||
            state is AuthenticationUnauthenticated) {
          return const SplashScreen();
        } else if (state is AuthenticationFailed) {
          return FailureScreen(errorString: T.authenticationFailed.tr());
        } else {
          return FailureScreen(errorString: T.authenticationFailed.tr());
        }
      },
    );
  }
}
