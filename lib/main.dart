import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/home/views/home_view.dart';
import 'package:quiz_demo/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeView(),
      getPages: AppPages.routes,
    );
  }
}
