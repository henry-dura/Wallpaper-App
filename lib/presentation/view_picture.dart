import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ViewPicture extends StatelessWidget {
  final pix_url;
  const ViewPicture({super.key, required this.pix_url});

  Future<void> setWallPaper() async {
    int location = WallpaperManager.HOME_SCREEN; //can be Home/Lock Screen
    var file = await DefaultCacheManager().getSingleFile(pix_url);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location); //provide image path
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: pix_url,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  // colorFilter:
                  // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      setWallPaper();
                      Navigator.pop(context);
                    },
                    child: const Text('Apply Wallpaper',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))))
      ],
    );
  }
}
