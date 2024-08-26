

import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable(createToJson: false)
class WallpaperModel {
  WallpaperModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  final int? page;

  @JsonKey(name: 'per_page')
  final int? perPage;
  final List<Photo>? photos;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  @JsonKey(name: 'next_page')
  final String? nextPage;

  factory WallpaperModel.fromJson(Map<String, dynamic> json) => _$WallpaperModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Photo {
  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;

  @JsonKey(name: 'photographer_url')
  final String? photographerUrl;

  @JsonKey(name: 'photographer_id')
  final int? photographerId;

  @JsonKey(name: 'avg_color')
  final String? avgColor;
  final Src? src;
  final bool? liked;
  final String? alt;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

}

@JsonSerializable(createToJson: false)
class Src {
  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  final String? original;

  @JsonKey(name: 'large2x')
  final String? large2X;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);

}
