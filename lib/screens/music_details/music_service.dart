import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playSong(SongModel song) async {
    try {
      // Check and set the file path
      String? songPath = song.data;
      if (songPath == null || songPath.isEmpty) {
        throw Exception("Invalid song path");
      }

      // Load and play the song
      await _audioPlayer.setFilePath(songPath);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  void stop() {
    _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
