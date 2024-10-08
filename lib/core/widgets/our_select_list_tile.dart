// ignore: depend_on_referenced_packages

import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

class OurSelectListTile extends StatefulWidget {
  const OurSelectListTile({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
  });
  final int groupValue;
  final int value;
  final String title;
  final String? subtitle;
  final void Function(int?)? onChanged;

  @override
  State<OurSelectListTile> createState() => _OurSelectListTileState();
}

class _OurSelectListTileState extends State<OurSelectListTile> {
  Widget buildSelectItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
          activeColor: secondColor,
        ),
        Expanded(
            child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: widget.subtitle != null
              ? Text(
                  widget.subtitle!,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                )
              : null,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSelectItem();
  }
}
