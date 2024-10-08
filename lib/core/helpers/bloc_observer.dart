import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      log(" ${"${bloc.runtimeType} current: ${change.currentState} next: ${change.nextState}"}");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    developer.log(transition.toString());
  }
}
