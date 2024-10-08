import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

class OurDivider extends StatelessWidget {
  final double? leftRightIndent;
  final Color? color;
  const OurDivider({
    super.key,
    this.leftRightIndent,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.25.h,
      color: color ?? lightGrayColor,
      endIndent: leftRightIndent,
      indent: leftRightIndent,
      thickness: 1.5,
    );
  }
}
