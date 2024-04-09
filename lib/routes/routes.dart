import 'package:get/get.dart';
import 'package:task/modules/api_view/api_screen.dart';
import 'package:task/modules/dashboard_view/dashboard_Screen.dart';
import 'package:task/modules/dashboard_view/dashboard_binding.dart';
import 'package:task/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => ApiScreen(),
    ),
    GetPage(
      name: AppRoutes.errorScreen,
      page: () => ApiScreen(),
    ),
    GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
