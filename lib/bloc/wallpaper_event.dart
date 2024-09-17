part of 'wallpaper_bloc.dart';

@immutable
sealed class WallpaperEvent {}

class WallpaperByCategory extends WallpaperEvent{
  final String category;
  WallpaperByCategory(this.category);
}
