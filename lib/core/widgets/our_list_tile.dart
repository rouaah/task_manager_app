import 'package:task_manager_app/core/widgets/image_loading_widget.dart';
import 'package:task_manager_app/core/routes/barrel.dart';

class OurListTile extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final double? leadingWidth;
  final Icon? trailing;
  final VoidCallback? onTab;
  final Widget? subtitle;
  const OurListTile({
    super.key,
    required this.title,
    this.imageUrl,
    this.onTab,
    this.leadingWidth,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 30),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: imageUrl != null
              ? Container(
                  height: 10.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            ImageLoadingWidget(size: 5.w),
                      )),
                )
              : null,
          title: Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          trailing: trailing,
          subtitle: subtitle,
        ),
      ),
    );
  }
}
