

import 'package:demo/domain/entities/parent_entity.dart';

import '../../core/data/data_state.dart';
import '../../core/usecase/usecase_core.dart';
import '../repository/media_player_repository.dart';

class LoadMediaByIdUsecase extends UsecaseCore<DataState<ParentEntity>, void>{
  final MediaPlayerRepository mediaPlayerRepository;

  LoadMediaByIdUsecase(this.mediaPlayerRepository);

  @override
  Future<DataState<ParentEntity>> call({void param}) {
    return mediaPlayerRepository.fetchMediaPlayerData();
  }
}