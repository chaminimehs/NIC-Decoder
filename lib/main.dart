import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(NICApp());
}

class NICApp extends StatelessWidget {
  const NICApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NIC Decoder',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => InputScreen()),
        GetPage(name: '/result', page: () => ResultScreen()),
      ],
    );
  }
}
