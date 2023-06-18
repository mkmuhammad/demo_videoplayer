import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/video_player_bloc.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VideoPlayerBloc>().add(const LoadVideoPlayerEvent());
  }

  @override
  void dispose() {
    super.dispose();
    context.read<VideoPlayerBloc>().add(const StopVideoPlayerEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Video Player', style: TextStyle(color: Colors.white),)),
        backgroundColor: const Color(0xff303030),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff303030),
          child: Column(
            children: [
              ///video player
              videoBlocHandler(
                context,
                onLoading: const Column(
                  children: [
                    SizedBox(
                      height: 36.0,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
                onError: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.error_outline),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('No Data')
                        ],
                      ),
                    ],
                  ),
                ),
                onDone: (state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Chewie(
                      controller: state.chewieController,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget videoBlocHandler(
    BuildContext context, {
    required Widget Function(VideoPlayerReadyState) onDone,
    Widget? onLoading,
    Widget? onError,
  }) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        if (state is VideoPlayerLoadingState) {
          return onLoading ?? const CircularProgressIndicator();
        }

        if (state is VideoPlayerErrorState) {
          onError ??
              const Text(
                'Failed to Load Video',
                style: TextStyle(color: Colors.white),
              );
        }

        if (state is VideoPlayerReadyState) {
          return onDone(state);
        }

        return const SizedBox();
      },
    );
  }
}
