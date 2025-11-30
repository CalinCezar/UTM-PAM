import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'controllers/news_controller.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(NewsController());
      }),
    );
  }
}
