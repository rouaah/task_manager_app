import 'package:flutter/material.dart';

class OurRadioButton extends StatelessWidget {
  final void Function(int?)? onChanged;
  final String title;
  final int value;
  final int? groupValue;
  const OurRadioButton({
    super.key,
    this.onChanged,
    required this.title,
    required this.value,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<int>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          fillColor: MaterialStateProperty.all(Colors.black),
        ),
        InkWell(
          onTap: () => onChanged!(value),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
