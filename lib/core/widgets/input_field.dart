// ignore: must_be_immutable

import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final BuildContext? formContext;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  bool obsecure;
  final bool showEye;
  final bool withBorder;
  final bool? enabled;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final String? valMessage;
  final TextInputType? type;
  final Function? onSubmit;
  final Function(String value)? onChanged;
  InputField({
    super.key,
    required this.label,
    required this.controller,
    this.obsecure = false,
    this.formContext,
    this.valMessage,
    this.withBorder = false,
    this.validator,
    this.showEye = false,
    this.enabled = true,
    this.prefixIcon,
    this.maxLines = 1,
    this.type,
    this.onChanged,
    this.suffixIcon,
    this.onSubmit,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      width: 100.w,
      // height: 7.h,
      child: TextFormField(
        onEditingComplete: () {
          if (widget.onSubmit != null) {
            widget.onSubmit!();
          } else {
            FocusScope.of(widget.formContext!).nextFocus();
          }
        },
        controller: widget.controller,
        enabled: widget.enabled,
        obscureText: widget.obsecure,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 16.sp,
        ),
        cursorColor: mainColor,
        maxLines: widget.maxLines,
        keyboardType: widget.type ?? TextInputType.text,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
            suffixIcon: widget.showEye
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obsecure = !widget.obsecure;
                      });
                    },
                    splashRadius: 12,
                    icon: Icon(
                      widget.obsecure ? Icons.visibility : Icons.visibility_off,
                      color: grayColor,
                    ))
                : widget.suffixIcon,
            filled: true,
            fillColor: Colors.white,
            errorStyle: const TextStyle(
                fontSize: 10,
                height: 1,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold),
            hintText: widget.label,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: widget.prefixIcon,
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: widget.validator ??
            (value) {
              if (value!.isEmpty) {
                return widget.valMessage;
              } else {
                return null;
              }
            },
      ),
    );
  }
}
