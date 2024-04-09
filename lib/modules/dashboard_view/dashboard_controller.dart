import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:task/modules/api_view/api_controller.dart';

class DashBoardController extends GetxController {
  int currentDashboardPage = 0;

  void updateCurrentDashboardPage({required int currentSelectedView}) {
    currentDashboardPage = currentSelectedView;
    update();
  }

  @override
  void onInit() {
    Get.lazyPut(() => ApiController());
    super.onInit();
  }
}
