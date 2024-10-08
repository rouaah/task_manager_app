import 'package:task_manager_app/app/features/home_screen.dart';
import 'package:task_manager_app/app/features/splash_screen.dart';
import 'package:task_manager_app/core/routes/routes.dart';

import 'barrel.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // final foretellerId = settings.arguments as int;
      // return MaterialPageRoute(
      //     builder: (_) => MultiBlocProvider(
      //           providers: const [
      //   BlocProvider(
      //     create: (context) => getIt<ForetellerDetailsCubit>(),
      //   ),
      //   BlocProvider(
      //     create: (context) => getIt<ReviewButtonCubit>(),
      //   ),
      //   BlocProvider(
      //     create: (context) => getIt<ServiceCubit>(),
      //   ),
      //   ],
      //   child: const SplashScreen(
      //   foretellerId: foretellerId,
      //       ),
      // ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
