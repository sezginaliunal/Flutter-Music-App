import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/models/song.dart';

class MusicController extends GetxController {
  var currentIndex = 0.obs;
  var isPlaying = false.obs;
  var position = const Duration(seconds: 0).obs;
  var duration = const Duration(seconds: 0).obs;
  late AudioPlayer audioPlayer;

  final List<Song> songs = [
    Song(
      imagePath: 'assets/song1.jpg',
      soundPath: 'song1.mp3',
      artistName: 'Çakal',
      songName: 'Cuma',
    ),
    Song(
        imagePath: 'assets/song2.jpg',
        soundPath: 'song2.mp3',
        artistName: 'Uzi Azer Bülbül',
        songName: 'Caney Official'),
    // Add more songs as needed
  ];

  @override
  void onInit() {
    super.onInit();
    initAudioPlayer();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    audioPlayer.onDurationChanged.listen((Duration duration) {
      this.duration.value = duration;
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      this.position.value = position;
    });

    audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });
  }

  void play() {
    if (isPlaying.value) {
      audioPlayer.pause();
      isPlaying.value = false;
    } else {
      audioPlayer.resume();
      isPlaying.value = true;
    }
  }

  void playNext() {
    if (currentIndex.value < songs.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    playSong();
  }

  void playPrevious() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      currentIndex.value = songs.length - 1;
    }
    playSong();
  }

  void playSong() async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource(songs[currentIndex.value].soundPath));
    isPlaying.value = true;
  }

  void seekTo(double seconds) {
    Duration newDuration = Duration(seconds: seconds.toInt());
    audioPlayer.seek(newDuration);
  }

  @override
  void onClose() {
    if (isPlaying.value) {
      audioPlayer.stop();
    }
    audioPlayer.dispose();
    super.onClose();
  }
}
