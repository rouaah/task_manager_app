import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/routes/barrel.dart';

class ListTryAgain extends StatelessWidget {
  const ListTryAgain({super.key, required this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(T.tryAgain.tr()),
              const Icon(Icons.replay_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
