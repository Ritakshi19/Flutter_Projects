// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

Photos photosFromJson(String str) => Photos.fromJson(json.decode(str));

String photosToJson(Photos data) => json.encode(data.toJson());

List<Photos> photosListFromJson(String str) {
  final jsonData = json.decode(str) as List;
  return jsonData.map((item) => Photos.fromJson(item)).toList();
}

class Photos {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Photos({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
