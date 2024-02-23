import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/music_controller.dart';
import 'package:music_app/controller/theme_controller.dart';
import 'package:music_app/views/music.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.musicController,
  }) : super(key: key);

  final MusicController musicController;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
        actions: [
          IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Obx(() => Icon(themeController.isDarkMode.value
                ? Icons.light_mode
                : Icons.dark_mode)),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: musicController.songs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        musicController.currentIndex.value = index;
                        musicController.playSong();
                        Get.to(MusicPlayerPage());
                      },
                      title: Text(musicController.songs[index].artistName),
                      subtitle: Text(musicController.songs[index].songName),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          musicController.songs[index].imagePath,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          color: Get.iconColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
