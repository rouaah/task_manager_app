import 'package:flutter/material.dart';
import 'package:task_manager_app/task_manager_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

SnackBar customSnackBar(message, color) => SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      backgroundColor: color.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.w))),
      content: Center(child: Text(message)),
    );

void showSnackBar(BuildContext context, String message, Color color,
    {bool clearPreviousSnacks = true}) {
  if (clearPreviousSnacks) ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    customSnackBar(message, color),
  );
}
