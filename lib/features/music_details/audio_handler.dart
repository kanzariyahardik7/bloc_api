import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioPlayerHandler() {
    // Listen to player state changes and update notification
    _player.playerStateStream.listen((state) {
      playbackState.add(playbackStateFromJustAudio(state));
    });
  }

  @override
  Future<void> play() async {
    _player.play();
  }

  @override
  Future<void> pause() async {
    _player.pause();
  }

  Future<void> loadMediaItem(MediaItem mediaItem, String url) async {
    this.mediaItem.add(mediaItem);
    await _player.setUrl(url);
  }

  PlaybackState playbackStateFromJustAudio(PlayerState state) {
    return PlaybackState(
      controls: [
        MediaControl.pause,
        MediaControl.play,
        MediaControl.stop,
      ],
      playing: state.playing,
      processingState: AudioProcessingState.values[state.processingState.index],
    );
  }
}
