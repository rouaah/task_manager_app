import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    super.key,
    required this.controller,
    this.width,
    this.height,
    this.hintText,
    this.onSubmit,
    this.onPressed,
    this.onFieldSubmitted,
    this.onFieldCleared,
    this.radius,
  });
  final TextEditingController controller;
  final double? width;
  final double? height;
  final String? hintText;
  final Function? onSubmit;
  final void Function()? onPressed;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onFieldCleared;
  final double? radius;

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 80.w,
      height: widget.height ?? 6.h,
      child: TextFormField(
        onEditingComplete: () {
          if (widget.onSubmit != null) {
            widget.onSubmit!();
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).nextFocus();
          }
        },
        onChanged: (value) => setState(() {}),
        controller: widget.controller,
        style: TextStyle(
          fontSize: 16.sp,
        ),
        cursorColor: mainColor,
        // maxLines: 1,
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 50.Q)),
            errorStyle: const TextStyle(
                fontSize: 10,
                height: 1,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold),
            labelText: widget.hintText ?? 'T.search.tr()',
            labelStyle: TextStyle(
                color: Colors.black38, fontSize: 17.sp, fontWeight: FontWeight.w400),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            prefixIcon: IconButton(
              onPressed: widget.onPressed,
              icon: Icon(
                Icons.search_rounded,
                size: 30.Q,
                color: Colors.black38,
              ),
            ),
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.close_sharp,
                      size: 30.Q,
                    ),
                    onPressed: widget.onFieldCleared,
                  )
                : const SizedBox(),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(widget.radius ?? 50.Q)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: grayColor, width: 2),
                borderRadius: BorderRadius.circular(widget.radius ?? 50.Q)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(widget.radius ?? 50.Q)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(widget.radius ?? 50.Q)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 50.Q))),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
