


import 'package:demo/domain/entities/parent_entity.dart';
import '../../core/data/data_state.dart';

abstract class MediaPlayerRepository{
  Future<DataState<ParentEntity>> fetchMediaPlayerData();
}