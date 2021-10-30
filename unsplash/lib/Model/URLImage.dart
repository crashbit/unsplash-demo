import 'dart:convert';

class URLImage {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  URLImage({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory URLImage.fromMap(Map<String, dynamic> map) {
    return URLImage(
      raw: map['raw'],
      full: map['full'],
      regular: map['regular'],
      small: map['small'],
      thumb: map['thumb'],
    );
  }

  factory URLImage.fromJson(String source) =>
      URLImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'URLImage(raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb)';
  }
}
