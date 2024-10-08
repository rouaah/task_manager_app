import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/routes/barrel.dart';

class OurErrorWidget extends StatelessWidget {
  final String error;
  final String? btnText;
  final VoidCallback onPressed;
  final bool miniError;
  const OurErrorWidget({
    super.key,
    required this.error,
    this.btnText,
    required this.onPressed,
    this.miniError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70.w,
            child: Center(
                child: Text(
              error,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.red, fontSize: 18.px),
              textAlign: TextAlign.center,
            )),
          ),
          SizedBox(height: !miniError ? 1.h : 0.h),
          miniError
              ? TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  label: Text(
                    btnText ?? T.tryAgain.tr(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onPressed: onPressed,
                  icon: const Icon(Icons.autorenew_sharp))
              : OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red)),
                  label: Text(
                    btnText ?? T.tryAgain.tr(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onPressed: onPressed,
                  icon: const Icon(Icons.autorenew_sharp)),
        ],
      ),
    );
  }
}
