import 'dart:convert';

class PhotoModel {
  PhotoModel(
      {required this.id,
      required this.albumId,
      required this.thumbnailUrl,
      required this.title,
      required this.url});

  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json['id'],
        thumbnailUrl: json['thumbnailUrl'],
        url: json['url'],
        title: json['title'],
        albumId: json['albumId'],
      );
}
