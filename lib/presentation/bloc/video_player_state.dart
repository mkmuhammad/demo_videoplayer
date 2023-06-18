part of 'video_player_bloc.dart';

abstract class VideoPlayerState extends Equatable {
  const VideoPlayerState();
}

class VideoPlayerInitial extends VideoPlayerState {
  @override
  List<Object> get props => [];
}

class VideoPlayerLoadingState extends VideoPlayerState{

  @override
  List<Object?> get props => [];
}

class VideoPlayerErrorState extends VideoPlayerState{
  final String error;

  const VideoPlayerErrorState(this.error);

  @override
  List<Object?> get props => [];
}

class VideoPlayerReadyState extends VideoPlayerState{
  final ChewieController chewieController;
  final VideoModel videoModel;
  const VideoPlayerReadyState({
    required this.chewieController,
    required this.videoModel,
  });

  @override
  List<Object?> get props => [videoModel];

}
