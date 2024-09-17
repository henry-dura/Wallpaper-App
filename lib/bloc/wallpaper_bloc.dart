

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/data/data_model.dart';
import 'package:wallpaper/data/repository.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  final WallpaperRepository repository;
  WallpaperBloc(this.repository) : super(WallpaperInitial()) {
    on<WallpaperByCategory>((event, emit) async {
      // TODO: implement event handler
      emit(WallpaperLoadingState());
      try {
        final wallpaperModel = await repository.getPhotos(event.category);
        print(wallpaperModel.photos?[10].url);

        emit(WallpaperLoadSuccessState(wallpaperModel));
      } catch (e) {
        emit(WallpaperLoadErrorState(e.toString()));
      }
    });
  }
}
