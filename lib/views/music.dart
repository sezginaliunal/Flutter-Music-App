import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/music_controller.dart';

class MusicPlayerPage extends StatelessWidget {
  final MusicController musicController = Get.find();

  MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    musicController
                        .songs[musicController.currentIndex.value].imagePath,
                  ),
                ),
              ),
            ),
            Text(
              musicController
                  .songs[musicController.currentIndex.value].artistName,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              musicController
                  .songs[musicController.currentIndex.value].songName,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: () {
                          musicController.playPrevious();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      child: IconButton(
                        icon: Icon(
                          musicController.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          musicController.play();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: () {
                          musicController.playNext();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(
                () => Column(
                  children: [
                    Slider(
                      value:
                          musicController.position.value.inSeconds.toDouble(),
                      max: musicController.duration.value.inSeconds.toDouble(),
                      onChanged: (value) {
                        musicController.seekTo(value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${musicController.position.value.inMinutes}:${(musicController.position.value.inSeconds % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          '${musicController.duration.value.inMinutes}:${(musicController.duration.value.inSeconds % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
