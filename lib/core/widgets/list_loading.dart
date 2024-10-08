import 'package:task_manager_app/core/widgets/loading_widget.dart';
import 'package:task_manager_app/core/routes/barrel.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Center(
        child: LoadingWidget(size: 10.w),
      ),
    );
  }
}
