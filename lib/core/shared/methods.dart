import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/Core/Routes/barrel.dart';
import 'package:task_manager_app/app/features/auth/logic/cubit/authentication_cubit.dart';
import 'package:task_manager_app/app/translations/text_keys.dart';
import 'package:task_manager_app/core/utils/dialog_util.dart';

Future<bool?> tokenCheckup(
    {required BuildContext context,
    required Function firstButtonFunc,
    Function? secondButtonFunc}) async {
  if (context.read<AuthenticationCubit>().state.runtimeType !=
      AuthenticationAuthenticated) {
    return await DialogUtils.loginDialog(
      context,
      content: 'T.registerNote.tr()',
      title: 'T.registrationRequired.tr()',
      firstButtonText: ' T.contnueAsGuest.tr()',
      secondButtonText: T.register.tr(),
      firstButtonFunc: firstButtonFunc,
      secondButtonFunc: secondButtonFunc,
    );
  }
  return false;
}
