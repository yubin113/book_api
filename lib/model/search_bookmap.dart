// To parse this JSON data, do
//
//     final searchBookMap = searchBookMapFromJson(jsonString);

import 'dart:convert';

List<SearchBookMap> searchBookMapFromJson(String str) => List<SearchBookMap>.from(json.decode(str).map((x) => SearchBookMap.fromJson(x)));

String searchBookMapToJson(List<SearchBookMap> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchBookMap {
  int bookMapId;
  String bookMapTitle;
  String bookMapContent;
  String? bookMapImage;
  List<String>? hashTag;
  bool share;

  SearchBookMap({
    required this.bookMapId,
    required this.bookMapTitle,
    required this.bookMapContent,
    required this.bookMapImage,
    required this.hashTag,
    required this.share,
  });

  factory SearchBookMap.fromJson(Map<String, dynamic> json) => SearchBookMap(
    bookMapId: json["bookMapId"],
    bookMapTitle: json["bookMapTitle"],
    bookMapContent: json["bookMapContent"],
    bookMapImage: json["bookMapImage"],
    hashTag: json["hashTag"] == null ? [] : List<String>.from(json["hashTag"]!.map((x) => x)),
    share: json["share"],
  );

  Map<String, dynamic> toJson() => {
    "bookMapId": bookMapId,
    "bookMapTitle": bookMapTitle,
    "bookMapContent": bookMapContent,
    "bookMapImage": bookMapImage,
    "hashTag": hashTag == null ? [] : List<dynamic>.from(hashTag!.map((x) => x)),
    "share": share,
  };
}
