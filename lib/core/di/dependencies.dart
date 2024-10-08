import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/app/features/auth/data/repos/auth_repo.dart';
import 'package:task_manager_app/app/features/auth/logic/cubit/authentication_cubit.dart';
import 'package:task_manager_app/app/features/preferences/logic/cubit/preferences_cubit.dart';
import 'package:task_manager_app/core/databases/boxes/preferences_box.dart';
import 'package:task_manager_app/core/databases/secure_storage/secure_storage.dart';
import 'package:task_manager_app/core/helpers/enums.dart';
import 'package:task_manager_app/task_manager_app.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final getIt = GetIt.instance;

class Dependencies {
  static void registerRepos() {
    //! Features
    //*** AUTH
    getIt.registerFactory(
      () => AuthenticationCubit(
        repo: getIt(),
        secureStorage: getIt(),
      )..appStarted(),
    );
    //*** PREFERENCES
    getIt.registerFactory(
      () => PreferencesCubit(
        preferencesBox: getIt<PreferencesBox>()
          ..setLanguage(EnumLanguage.values
              .byName(navigatorKey.currentContext!.locale.toString())
              .index),
      ),
    );

    //! Repositories
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());

    //! External packages
    getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());

    //! Boxes
    getIt.registerLazySingleton<PreferencesBox>(
        () => PreferencesBox(Hive.box(PreferencesBox.boxName)));
  }
}
