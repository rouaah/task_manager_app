import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/core/widgets/button.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';

class PageIntroCard extends StatelessWidget {
  const PageIntroCard({
    super.key,
    required this.title,
    required this.body,
    required this.image,
    this.imageWidth,
    required this.upperHeight,
    required this.upperPadding,
    required this.bodyWidth,
    this.margin,
    this.showSubscribeButton = false,
    this.subscribeFunction,
  });

  final String title;
  final String body;
  final String image;
  final double? imageWidth;
  final double upperHeight;
  final double upperPadding;
  final double bodyWidth;
  final double? margin;
  final bool? showSubscribeButton;
  final Function()? subscribeFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: upperHeight), //
            Container(
              width: 100.w,
              margin: EdgeInsets.symmetric(horizontal: margin ?? 0.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                gradient: LinearGradient(
                  colors: [
                    mainColor.withOpacity(0.3),
                    mainColor.withOpacity(0.4),
                    mainColor.withOpacity(0.5)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: upperPadding), //
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: bodyWidth,
                    child: Text(
                      body,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  showSubscribeButton == true
                      ? Column(
                          children: [
                            SizedBox(height: 1.5.h),
                            Button(
                                buttonWidth: 45.w,
                                buttonHight: 4.h,
                                text: "subscribe now",
                                fontSize: 16.px,
                                onPressed: subscribeFunction),
                            SizedBox(height: 1.h),
                          ],
                        )
                      : SizedBox(height: 3.h),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 0,
            right: context.locale.languageCode == "en" ? 16 : null,
            left: context.locale.languageCode == "en" ? null : 16,
            child: SizedBox(width: imageWidth, child: Image.asset(image))),
      ],
    );
  }
}
