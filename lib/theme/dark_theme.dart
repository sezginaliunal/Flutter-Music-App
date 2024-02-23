// Özel Dark Tema
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black54,
    cardTheme: const CardTheme(color: Color.fromARGB(255, 53, 47, 47)),
    appBarTheme: const AppBarTheme(
        color: Colors.transparent, centerTitle: true, elevation: 0),
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Colors.white),
    sliderTheme: SliderThemeData(
      thumbColor: Colors.white, // Başparmak rengi siyah
      activeTrackColor: Colors.white, // Aktif izleme rengi siyah
      inactiveTrackColor:
          Colors.white.withOpacity(.5), // Pasif izleme rengi gri
    ));
