import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper/bloc/wallpaper_bloc.dart';

import '../view_picture.dart';

class WallPaperGrid extends StatefulWidget {
  final String category;

  const WallPaperGrid({super.key, required this.category});

  @override
  State<WallPaperGrid> createState() => _WallPaperGridState();
}

class _WallPaperGridState extends State<WallPaperGrid> {
  @override
  void initState(){
    super.initState();
    WallpaperBloc wallpaperBloc = BlocProvider.of<WallpaperBloc>(context);

    wallpaperBloc.add(WallpaperByCategory(widget.category));


  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
      builder: (context, state) {
        if (state is WallpaperLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WallpaperLoadSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2), // Large tile spanning 2x2
                  const QuiltedGridTile(1, 1), // Small tile 1x1
                  const QuiltedGridTile(1, 1), // Small tile 1x1
                  const QuiltedGridTile(1, 2), // Large tile spanning 1x2
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  String? url = state.wallpaperModel.photos?[index].src?.original;
                  return GestureDetector(
                  onTap: ()=>Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewPicture(pix_url:url),
                    ),
                  ),

                  child: Container(
                    // color: Colors.green,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: '${state.wallpaperModel.photos?[index].src?.original}',
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
                    // child: Image.network('https://www.pexels.com/photo/snow-coated-rocky-mountains-772803/')
                  ),
                );
                },
                childCount: state.wallpaperModel.perPage, // Number of items in the grid
              ),
            ),
          );
        } else if (state is WallpaperLoadErrorState) {
          return Text(
            state.errorMessage,
            style: const TextStyle(color: Colors.red),
          );
        }
        return const SizedBox();
      },
    );
  }
}
