import 'package:flutter/material.dart';
import 'package:task_manager_app/core/extensions/context_shortcuts.dart';
import 'package:task_manager_app/core/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("home screen "),
            TextButton(
                onPressed: () {
                  context.go(Routes.splashScreen);
                },
                child: const Text('go splash '))
          ],
        ),
      )),
    );
  }
}
