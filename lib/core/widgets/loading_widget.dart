import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

class LoadingWidget extends StatelessWidget {
  final double? size;
  final double? padding;
  const LoadingWidget({
    super.key,
    this.size,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, top: padding ?? 0.0),
      child: LoadingAnimationWidget.discreteCircle(
        color: mainColor,
        secondRingColor: mainColor.withOpacity(0.8),
        thirdRingColor: mainColor.withOpacity(0.6),
        size: size ?? 15.w,
      ),
    );
  }
}
