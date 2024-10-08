import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<List<dynamic>> showSheet(BuildContext context, Widget child) async {
  // Note that, the selected language code passed back from language tile widget

  final code = await showModalBottomSheet(
    context: context,
    elevation: 3,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.Q), topRight: Radius.circular(40.Q))),
    builder: (context) {
      return child;
    },
  );

  // Check if selected language is different from current language

  return [code, code != context.locale.toString()];
}

Future<dynamic> showFilterSheet(BuildContext context, Widget child) async {
  var x = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    isDismissible: false,
    enableDrag: false,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.Q), topRight: Radius.circular(40.Q))),
    builder: (context) {
      return child;
    },
  );
  return x;
}
