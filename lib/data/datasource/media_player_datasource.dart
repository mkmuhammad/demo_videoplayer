import '../../core/data/network/api_provider.dart';

class MediaPlayerDataSource {
  Future<Map<String,dynamic>> getMediaPlayerData({required String url}) async {
    return ApiProvider().get(url);
  }
}
