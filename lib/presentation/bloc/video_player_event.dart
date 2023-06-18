part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();
}

class LoadVideoPlayerEvent extends VideoPlayerEvent {

  const LoadVideoPlayerEvent();

  @override
  List<Object?> get props => [];

}

class StopVideoPlayerEvent extends VideoPlayerEvent {
  @override
  List<Object?> get props => [];

  const StopVideoPlayerEvent();
}