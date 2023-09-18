import 'dart:convert';

import 'package:getxlevel2/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../model/search_bookmap.dart';

class Services {
  static var client = http.Client();

  static Future<List<Document>?> fetchBooks(searchText) async {
    print(searchText);
    var response = await client.get(
        Uri.parse(
            'https://dapi.kakao.com/v3/search/book?target=title&query=$searchText'),
        headers: {"Authorization": "KakaoAK 15143c9a4aee2d6700abc8ef957d0dc6"});
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var documents = bookFromJson(jsonData).documents;

      if (documents.isNotEmpty) {
        return documents;
      } else {
        return null; // 검색 결과가 없을 경우 null 반환
      }
    } else {
      return null;
    }
  }

  static Future<List<SearchBookMap>?> fetchBookmaps(searchText) async {
    var response = await client
        .get(Uri.parse('http://172.17.142.220:8080/bookmap/search/$searchText'),);
    if (response.statusCode == 200) {
      var jsonData = utf8.decode(response.bodyBytes); // 바이트 데이터를 디코딩
      var documents = searchBookMapFromJson(jsonData);
      if (documents.isNotEmpty) {
        return documents;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
