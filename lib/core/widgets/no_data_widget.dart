import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/routes/barrel.dart';

class NoDataWidget extends StatelessWidget {
  final String? message;
  const NoDataWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 80.Q,
          ),
          Text(
            message ?? T.noData.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
