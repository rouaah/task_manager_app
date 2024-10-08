import 'package:task_manager_app/core/widgets/shimmer/skelton.dart';

import '../../Routes/barrel.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Skelton(width: 90.w, height: 15.h, radius: 20.px),
    );
  }
}
