import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewPicture extends StatelessWidget {
  final  pix_url;
  const ViewPicture({super.key, required this.pix_url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [SizedBox(
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
            child:  Center(child: ElevatedButton(onPressed: (){}, child: const Text('Apply Wallpaper',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))))

      ],

    );
  }
}
