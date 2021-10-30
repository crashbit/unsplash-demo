import 'dart:convert';

import 'package:unsplash/Model/URLImage.dart';

class UnsplashImage {
  final String id;
  final String? description;
  final URLImage urls;

  UnsplashImage({
    required this.id,
    this.description,
    required this.urls,
  });

  factory UnsplashImage.fromMap(Map<String, dynamic> map) {
    return UnsplashImage(
      id: map['id'],
      description: map['description'] != null ? map['description'] : null,
      urls: URLImage.fromMap(map['urls']),
    );
  }

  factory UnsplashImage.fromJson(String source) =>
      UnsplashImage.fromMap(json.decode(source));

  @override
  String toString() =>
      'UnsplashImage(id: $id, description: $description, urls: $urls)';
}
