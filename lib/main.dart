import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/theme.dart';
import 'package:task/modules/dashboard_view/dashboard_binding.dart';
import 'package:task/modules/dashboard_view/dashboard_Screen.dart';
import 'package:task/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeColor().themeData,
      home: const DashboardScreen(),
      initialBinding: DashboardBinding(),
      getPages: AppPages.pages,
    );
  }
}
