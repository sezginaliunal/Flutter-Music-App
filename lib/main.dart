import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/music_controller.dart';
import 'package:music_app/theme/dark_theme.dart';
import 'package:music_app/theme/light_theme.dart';
import 'package:music_app/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MusicController musicController = Get.put(MusicController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(
        musicController: musicController,
      ),
    );
  }
}
