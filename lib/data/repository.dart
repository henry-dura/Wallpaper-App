
import 'package:wallpaper/data/data_model.dart';

import 'Api_provider.dart';

class WallpaperRepository {
  final ApiProvider apiProvider = ApiProvider();
  Future<WallpaperModel> getPhotos(String category) async {
    return await apiProvider.fetchPhotos(category);

  }
}
