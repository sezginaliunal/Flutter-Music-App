// Özel Light Tema
import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey.shade300,
    cardTheme: const CardTheme(color: Colors.white),
    appBarTheme: const AppBarTheme(
        color: Colors.transparent, centerTitle: true, elevation: 0),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    sliderTheme: SliderThemeData(
      thumbColor: Colors.black, // Başparmak rengi siyah
      activeTrackColor: Colors.black, // Aktif izleme rengi siyah
      inactiveTrackColor:
          Colors.black.withOpacity(.5), // Pasif izleme rengi gri
    ));
