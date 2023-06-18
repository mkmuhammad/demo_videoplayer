import 'package:demo/presentation/bloc/video_player_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/data/network/api_provider.dart';
import 'data/datasource/media_player_datasource.dart';
import 'data/repository/media_player_repository_impl.dart';
import 'domain/repository/media_player_repository.dart';
import 'domain/usecase/load_media_by_id_usecase.dart';

GetIt injector = GetIt.instance;

Future<void> injectDependencies() async {
  /// injection / provider
  /// api
  injector.registerSingleton<ApiProvider>(ApiProvider());

  ///Datasource
  injector.registerSingleton<MediaPlayerDataSource>(MediaPlayerDataSource());

  ///Repositories
  injector.registerSingleton<MediaPlayerRepository>(MediaPlayerRepositoryImpl(injector<MediaPlayerDataSource>()));

  ///Usecase
  //media_player
  injector.registerSingleton<LoadMediaByIdUsecase>(LoadMediaByIdUsecase(injector<MediaPlayerRepository>()));


  ///BLOC
  injector.registerSingleton<VideoPlayerBloc>(VideoPlayerBloc(
    injector<LoadMediaByIdUsecase>(),
  ));

}
