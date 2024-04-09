import 'package:get/instance_manager.dart';
import 'package:task/modules/dashboard_view/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}
