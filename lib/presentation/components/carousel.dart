import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';


import '../../bloc/wallpaper_bloc.dart';

class CustomCarousel extends StatelessWidget {

  late List carouselPics;
 int randomGenerator(){
   Random random = Random();
   int randomNumber = random.nextInt(1) + random.nextInt(49);
   return randomNumber.round();
 }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
  builder: (context, state)
    {
      if (state is WallpaperLoadingState){
        carouselPics = [];
      }
      if (state is WallpaperLoadSuccessState) {

        for(int i = 0; i < 5; i++){
          int num = randomGenerator();
          String? url = state.wallpaperModel.photos?[num].src?.original;
          carouselPics.add(url);
        }

        return CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            viewportFraction: 0.4,
            autoPlayInterval: const Duration(milliseconds: 1000),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
          ),
          items: carouselPics.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '$i',
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                    imageBuilder: (context, imageProvider) =>
                        Container(
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
                );
              },
            );
          }).toList(),
        );
      }

      return SizedBox();

  },
);
  }
}
