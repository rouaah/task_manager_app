import 'package:task_manager_app/Core/Routes/barrel.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OurDropDown extends StatelessWidget {
  final String? value;
  final void Function(String?)? onChanged;
  final List<String> list;
  final String hint;
  final double? width;
  final void Function()? iconOnPress;
  final Color iconColor;
  const OurDropDown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.list,
    required this.hint,
    this.width,
    this.iconOnPress,
    this.iconColor = mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 1.h),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  hint,
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
                value: value,
                items: buildDropDownItems(list),
                onChanged: onChanged,
                buttonStyleData: ButtonStyleData(
                  height: 7.h,
                  width: 16.w,
                  padding: EdgeInsets.only(left: 2.4.w, right: 2.4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: iconColor == mainColor ? Colors.black54 : iconColor,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 30.h,
                    // width: 200,
                    // padding: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 8,
                    offset: const Offset(00, -5),
                    scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                        interactive: true)),
                menuItemStyleData: MenuItemStyleData(
                  height: 4.h,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: iconOnPress != null,
          child: IconButton(
            onPressed: iconOnPress,
            icon: const Icon(Icons.add),
            color: iconColor,
          ),
        )
      ],
    );
  }
}

List<DropdownMenuItem<String>> buildDropDownItems(List<String> list) {
  return [
    ...list.map((e) => DropdownMenuItem(
          value: e,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(e),
          ),
        ))
  ];
}
