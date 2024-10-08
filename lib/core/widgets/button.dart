import 'package:task_manager_app/core/styles/style.dart';

import '../routes/barrel.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? buttonWidth;
  final double? buttonHight;
  final Color buttonColor;
  final Color textColor;
  final double? elevation;
  final Color? borderColor;
  final Color? iconColor;
  final IconData? icon;
  final double? fontSize;
  final bool enable;
  final double? raduis;
  final Image? imageIcon;
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.buttonHight,
      this.buttonColor = mainColor,
      this.textColor = secondColor,
      this.elevation,
      this.borderColor,
      this.icon,
      this.enable = true,
      this.iconColor,
      this.raduis,
      this.fontSize,
      this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: buttonWidth ?? 80.w,
        height: buttonHight ?? 6.5.h,
        child: icon == null && imageIcon == null
            ? ElevatedButton(
                style: TextButton.styleFrom(
                    elevation: elevation,
                    backgroundColor: buttonColor,
                    disabledBackgroundColor: grayColor,
                    shape: RoundedRectangleBorder(
                        side: borderColor == null
                            ? BorderSide.none
                            : BorderSide(color: borderColor!, width: 2),
                        borderRadius: BorderRadius.circular(raduis ?? 12))),
                onPressed: enable ? onPressed : null,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: fontSize ?? 18.sp),
                  ),
                ))
            : ElevatedButton.icon(
                style: TextButton.styleFrom(
                  elevation: elevation,
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                      side: borderColor == null
                          ? BorderSide.none
                          : BorderSide(color: borderColor!, width: 2),
                      borderRadius: BorderRadius.circular(raduis ?? 20)),
                ),
                onPressed: enable ? onPressed : null,
                icon: imageIcon != null
                    ? imageIcon!
                    : Icon(
                        icon,
                        color: iconColor ?? Colors.white,
                      ),
                label: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontWeight:
                            imageIcon != null ? FontWeight.bold : FontWeight.normal,
                        fontSize: fontSize ?? 18.sp),
                  ),
                )));
  }
}
