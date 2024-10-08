import 'package:task_manager_app/core/styles/style.dart';

import '../routes/barrel.dart';

class ImageLoadingWidget extends StatelessWidget {
  final double? size;
  final double? padding;
  final Color? color;
  const ImageLoadingWidget({
    super.key,
    this.size,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: color ?? grayColor,
        size: size ?? 5.w,
      ),
    );
  }
}
