import 'dart:developer' as developer;

import 'package:task_manager_app/app/features/auth/data/repos/auth_repo.dart';
import 'package:task_manager_app/core/databases/secure_storage/secure_storage.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SecureStorage? secureStorage;
  final AuthRepo? repo;

  AuthenticationCubit({required this.secureStorage, required this.repo})
      : super(AuthenticationUninitialized());

  Future<void> appStarted() async {
    print("************** appstarted called....");
    // emit(AuthenticationLoading());
    // await Future.delayed(const Duration(seconds: 1));
    // await _cleanIfFirstUseAfterUninstall();
    _initStartup();
  }

  Future<void> _initStartup() async {
    try {
      final hasAccessToken = await secureStorage!.hasAccessToken();
      if (!hasAccessToken) {
        emit(AuthenticationUnauthenticated());
        // emit(AuthenticationAuthenticated());
        return;
      } else {
        // bool isoldInstalledVersion = await checkAppVersion();
        // if (isoldInstalledVersion) {
        //   emit(AuthenticationUnauthenticated());
        //   return;
        // }
        emit(AuthenticationAuthenticated());
      }
    } catch (error) {
      developer.log(error.toString());
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> logout() async {
    emit(AuthenticationLoading());
    await repo!.logout();
    await clear();
    emit(AuthenticationLoggingOut());
  }

  Future<void> clear() async {
    await secureStorage!.deleteAll();
  }

  // Future<void> _cleanIfFirstUseAfterUninstall() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getBool('first_run') ?? true) {
  //     await storage!.deleteAll();
  //     await prefs.setBool('first_run', false);
  //   }
  // }
}
