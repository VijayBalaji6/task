import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/modules/api_view/api_screen.dart';
import 'package:task/modules/dashboard_view/dashboard_controller.dart';
import 'package:task/modules/home_view/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AppBodyView(),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}

class AppBodyView extends StatelessWidget {
  const AppBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return controller.currentDashboardPage == 0
          ? const HomeView()
          : ApiScreen();
    });
  }
}

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.indigo,
        selectedLabelStyle: TextStyle(color: AppColor.indigo, fontSize: 12),
        unselectedItemColor: AppColor.darkGrey,
        unselectedLabelStyle: TextStyle(color: AppColor.darkGrey, fontSize: 12),
        backgroundColor: AppColor.lightGrey,
        showUnselectedLabels: true,
        currentIndex: controller.currentDashboardPage,
        onTap: (currentSelectedPage) => controller.updateCurrentDashboardPage(
            currentSelectedView: currentSelectedPage),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: "Portfolio"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: AppColor.indigo,
                child: const Icon(
                  Icons.waves,
                  color: AppColor.white,
                ),
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph), label: "Prices"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      );
    });
  }
}
