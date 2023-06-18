import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:demo/data/model/video_model.dart';
import 'package:demo/domain/entities/parent_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/data/data_state.dart';
import '../../domain/usecase/load_media_by_id_usecase.dart';

part 'video_player_event.dart';

part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  late DataState<ParentEntity> _parentDataState;
  ParentEntity? _mediaDataEntity;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final LoadMediaByIdUsecase _loadMediaByIdUsecase;
  Stream<Duration?>? durationStr;

  VideoPlayerBloc(this._loadMediaByIdUsecase) : super(VideoPlayerLoadingState()) {
    on<LoadVideoPlayerEvent>(_onLoadVideoEvent);
    on<StopVideoPlayerEvent>(_onStopVideoEvent);
  }

  void _onLoadVideoEvent(LoadVideoPlayerEvent event, Emitter<VideoPlayerState> emitter) async {
    emitter(VideoPlayerLoadingState());

    _parentDataState = await _loadMediaByIdUsecase.call();

    if (_parentDataState is DataSuccess && _parentDataState.data!.categories?[0].videos?[0].sources?[0] != null) {
      var url = _parentDataState.data!.categories![0].videos![0].sources![0];
      _videoPlayerController = VideoPlayerController.network(url);
      await _videoPlayerController.initialize();

      _mediaDataEntity = _parentDataState.data;

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
      );

      emitter(VideoPlayerReadyState(chewieController: _chewieController, videoModel: _mediaDataEntity!.categories![0].videos![0]));
    } else if (_parentDataState is DataError || _parentDataState.data!.categories?[0].videos?[0].sources?[0] == null) {
      emitter(VideoPlayerErrorState(_parentDataState.error ?? 'Error'));
    }
  }

  void _onStopVideoEvent(StopVideoPlayerEvent event, Emitter<VideoPlayerState> emitter) async {
    await _chewieController.pause();
    await _videoPlayerController.pause();
    _chewieController.dispose();
    await _videoPlayerController.dispose();
    emitter(const VideoPlayerErrorState('stopped'));
  }
}
