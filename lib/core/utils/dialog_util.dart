import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/styles/style.dart';

import '../widgets/our_dialog.dart';
import '../helpers/images.dart';

class DialogUtils {
  static Future<void> ourAlertDialog(
    BuildContext context, {
    String? svgIcon,
    Icon? icon,
    required String content,
    required String title,
    bool preventBackword = false,
    String firstButtonText = 'Cancel',
    String secondButtonText = 'Ok',
    Function? firstButtonFunc,
    Function? secondButtonFunc,
  }) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: OurDialog(
              contentText: content,
              svgIcon: svgIcon,
              icon: icon,
              title: title,
              firstButtonText: firstButtonText,
              cancelButtonFunc: firstButtonFunc,
              secondButtonText: secondButtonText,
              secoundButtonFunc: secondButtonFunc,
              preventBackword: preventBackword),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }

  static Future<void> successDialog(BuildContext context,
      {bool preventBackword = false,
      String? buttonText,
      Function? buttonFunc,
      String? contentText}) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: OurDialog(
              contentText: contentText ?? T.congrats.tr(),
              svgIcon: Images.successIcon,
              title: T.dialogSuccessTitle.tr(),
              firstButtonText: buttonText ?? T.yes.tr(),
              cancelButtonFunc: buttonFunc,
              preventBackword: preventBackword),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }

  static Future<void> failedDialog(
    BuildContext context, {
    bool preventBackword = false,
    String buttonText = 'Cancel',
    required String contentText,
    Function? buttonFunc,
  }) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: OurDialog(
              contentText: contentText,
              svgIcon: Images.failureIcon,
              title: T.dialogErrorTitle.tr(),
              color: mainColor,
              firstButtonText: buttonText,
              cancelButtonFunc: buttonFunc,
              preventBackword: preventBackword),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }

  static Future<bool?> loginDialog(
    BuildContext context, {
    String? svgIcon,
    Icon? icon = const Icon(Icons.privacy_tip_outlined, size: 100),
    required String content,
    required String title,
    bool preventBackword = true,
    String firstButtonText = 'Continue as guest user',
    String secondButtonText = 'Register',
    Function? firstButtonFunc,
    Function? secondButtonFunc,
  }) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: OurDialog(
              contentText: content,
              svgIcon: svgIcon,
              icon: icon,
              title: title,
              firstButtonText: firstButtonText,
              cancelButtonFunc: firstButtonFunc,
              secondButtonText: secondButtonText,
              secoundButtonFunc: secondButtonFunc,
              preventBackword: preventBackword),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }

  static Future<dynamic>? pickImageDialog(
    BuildContext context, {
    bool preventBackword = false,
    bool isProfileImage = false,
  }) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          // child:
          // PickImageDialog(
          //   preventBackword: preventBackword,
          //   isProfileImage: isProfileImage,
          // )
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }

  static Future<dynamic>? recordVoiceDialog(
    BuildContext context, {
    bool preventBackword = false,
  }) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          // child: RecordVoiceDialog(preventBackword: preventBackword)
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Container();
      },
    );
  }
}
