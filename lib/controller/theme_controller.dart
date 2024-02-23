import 'package:get/get.dart';
import 'package:music_app/theme/dark_theme.dart';
import 'package:music_app/theme/light_theme.dart';

class ThemeController extends GetxController {
  // Tema durumu değişkeni
  var isDarkMode = false.obs;

  // Temayı değiştiren metod
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    // Tema değişikliğini GetX üzerinden uygula
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }
}
