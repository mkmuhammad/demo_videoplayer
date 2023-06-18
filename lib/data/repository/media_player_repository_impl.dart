
import 'package:demo/data/model/parent_model.dart';
import 'package:flutter/foundation.dart';
import '../../core/data/data_state.dart';
import '../../core/utils/constants/constant.dart';
import '../../domain/entities/parent_entity.dart';
import '../../domain/repository/media_player_repository.dart';
import '../datasource/media_player_datasource.dart';

class MediaPlayerRepositoryImpl extends MediaPlayerRepository {
  final MediaPlayerDataSource _mediaPlayerDataSource;

  MediaPlayerRepositoryImpl(this._mediaPlayerDataSource);

  @override
  Future<DataState<ParentEntity>> fetchMediaPlayerData() async {
    try {
      Map<String, dynamic> response =
          await _mediaPlayerDataSource.getMediaPlayerData(url: BASE_URL);

      ParentEntity musicDataEntity = ParentModel.fromJson(response);
      return DataSuccess(musicDataEntity);
    } catch (apiException) {
      _exceptionLogging(apiException);
      return DataError(apiException.toString());
    }
  }
  void _exceptionLogging(Object e) {
    debugPrint('mediaPlayerRepoImpl ${e.toString()}');
  }
}
