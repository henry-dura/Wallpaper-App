part of 'wallpaper_bloc.dart';

@immutable
sealed class WallpaperState {}

final class WallpaperInitial extends WallpaperState {}

final class WallpaperLoadingState extends WallpaperState{}

final class WallpaperLoadSuccessState extends WallpaperState{
  final WallpaperModel wallpaperModel;

  WallpaperLoadSuccessState(this.wallpaperModel);
}


final class WallpaperLoadErrorState extends WallpaperState{
  final String errorMessage;

  WallpaperLoadErrorState(this.errorMessage);
}