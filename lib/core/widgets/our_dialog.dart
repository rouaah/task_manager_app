import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/core/widgets/button.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

class OurDialog extends StatelessWidget {
  final String? svgIcon;
  final Icon? icon;
  final String title;
  final String contentText;
  final String firstButtonText;
  final String? secondButtonText;
  final Function? secoundButtonFunc;
  final Function? cancelButtonFunc;
  final bool preventBackword;
  final Color? color;
  const OurDialog(
      {super.key,
      this.svgIcon,
      this.icon,
      required this.contentText,
      this.secondButtonText,
      this.secoundButtonFunc,
      this.cancelButtonFunc,
      this.preventBackword = false,
      required this.firstButtonText,
      this.color,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !preventBackword,
      child: SimpleDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                svgIcon != null
                    ? SizedBox(
                        width: 35.w, height: 35.w, child: SvgPicture.asset(svgIcon!))
                    : icon != null
                        ? icon!
                        : const SizedBox.shrink(),
                SizedBox(height: 1.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: color ?? mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 70.w,
                  child: Text(
                    contentText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.h),
                secondButtonText == null
                    ? Button(
                        text: firstButtonText,
                        textColor: Colors.white,
                        elevation: 2,
                        buttonWidth: firstButtonText != T.cancel.tr() ? 40.w : 30.w,
                        onPressed: () {
                          cancelButtonFunc == null
                              ? Navigator.of(context).pop()
                              : cancelButtonFunc!();
                        },
                        buttonColor: color ?? mainColor,
                        raduis: 40.Q,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(
                            text: firstButtonText,
                            textColor: const Color(0xFF999999),
                            elevation: 0,
                            buttonWidth: 30.w,
                            borderColor: const Color(0xFF999999),
                            onPressed: () {
                              cancelButtonFunc == null
                                  ? Navigator.of(context).pop()
                                  : cancelButtonFunc!();
                            },
                            buttonColor: Colors.white,
                          ),
                          secondButtonText != null
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: 1.5.w,
                                    ),
                                    Button(
                                      text: secondButtonText!,
                                      elevation: 0,
                                      buttonWidth: 30.w,
                                      onPressed: () => {
                                        secoundButtonFunc == null
                                            ? Navigator.of(context).pop()
                                            : secoundButtonFunc!()
                                      },
                                      buttonColor: mainColor,
                                    )
                                  ],
                                )
                              : Container()
                        ],
                      ),
              ],
            ),
          ]),
    );
  }
}
