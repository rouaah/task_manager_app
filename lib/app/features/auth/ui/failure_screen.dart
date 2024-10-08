// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_manager_app/core/Routes/barrel.dart';
import 'package:task_manager_app/core/helpers/images.dart';
import 'package:task_manager_app/core/helpers/spacing.dart';

class FailureScreen extends StatelessWidget {
  final String errorString;
  const FailureScreen({Key? key, required this.errorString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: SizedBox(
                  height: 50.h,
                  child: Image.asset(
                    Images.unathorized,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              verticalSpace(1.h),
              Text(
                'You are not authorized to access this page. Please register first then try agian.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 16.px, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
