import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/usersList/bindings/users_list_binding.dart';
import '../modules/usersList/views/users_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USERS_LIST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USERS_LIST,
      page: () => UsersListView(),
      binding: UsersListBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
