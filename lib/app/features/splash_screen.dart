import 'package:flutter/material.dart';
import 'package:task_manager_app/core/extensions/context_shortcuts.dart';
import 'package:task_manager_app/core/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("splash screen "),
            TextButton(
                onPressed: () {
                  context.go(Routes.homeScreen);
                },
                child: const Text('go home '))
          ],
        ),
      )),
    );
  }
}
