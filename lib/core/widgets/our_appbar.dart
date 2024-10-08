import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/Core/Routes/barrel.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/helpers/images.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/core/styles/style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// ignore: must_be_immutable
class OurAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? barColor;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final bool withNotification;
  final bool hideBackButton;

  OurAppBar({
    super.key,
    required this.title,
    this.barColor,
    this.bottom,
    this.withNotification = false,
    this.hideBackButton = false,
    this.actions,
  });
  double userGems = 0.0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hideBackButton ? buildMenuButton(context) : _buildLeadingWidget(context),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      toolbarHeight: 20.h,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      foregroundColor: Colors.black,
      actions: withNotification
          ? [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  iconSize: 30,
                  icon: Image.asset(
                    Images.notificaions,
                    height: 8.w,
                  ),
                  onPressed: () => debugPrint("navigation ..."),
                ),
              )
            ]
          : actions,
      bottom: bottom,
    );
  }

  Widget buildMenuButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: Image.asset(Images.more),
          onMenuStateChange: (_) {
            // context.read<UserGemsCubit>().getUserGems();
          },
          onChanged: (val) {
            switch (val) {
              case 1:
                {
                  // context.go(MyPlansScreen.routeName);
                }

              case 2:
                {
                  // context.go(SettingScreen.routeName);
                }
            }
          },
          dropdownStyleData: DropdownStyleData(
            width: 38.w,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              border: Border.all(color: Colors.blue),
            ),
          ),
          items: const [
            // DropdownMenuItem(
            //   value: 2,
            //   child: Row(
            //     children: [
            //       Image.asset(
            //         Images.settingsSmallIcon,
            //         width: 5.w,
            //         height: 5.w,
            //       ),
            //       SizedBox(width: 1.w),
            //       Text(T.settings.tr(), style: Theme.of(context).textTheme.bodySmall),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, bottom != null ? 15.h : 5.h);
}

Widget? _buildLeadingWidget(BuildContext context) {
  final ScaffoldState scaffold = Scaffold.of(context);
  final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);

  final bool canPop = ModalRoute.of(context)?.canPop ?? false;
  final bool hasDrawer = scaffold.hasDrawer;
  final bool useCloseButton =
      parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

  Widget? leading;
  if (hasDrawer) {
    leading = IconButton(
      icon: const Icon(Icons.menu_rounded),
      onPressed: Scaffold.of(context).openDrawer,
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  } else {
    if (canPop) {
      if (useCloseButton) {
        leading = IconButton(
            color: Theme.of(context).colorScheme.onBackground,
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.of(context).maybePop());
      } else {
        leading = IconButton(
            padding: const EdgeInsets.all(0),
            iconSize: 30,
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop);
      }
    }
  }

  return leading;
}
