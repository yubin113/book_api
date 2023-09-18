import 'dart:ffi';

import 'package:get/get.dart';
import 'package:getxlevel2/model/product_model.dart';
import 'package:getxlevel2/data/services.dart';
import 'package:getxlevel2/model/search_bookmap.dart';

class Controller extends GetxController {
  var bookList = <Document>[].obs;
  var bookMapList  = <SearchBookMap>[].obs;
  var searchText = ''.obs;
  var tabStatus = true.obs;

  void toggleTabs() {
    tabStatus.value = !tabStatus.value;
    fetchData();
    // if (tabStatus.value == true) {
    //   fetchData();
    // } else {
    //   //네트워크
    // }
  }

    @override
    void onInit() {
      super.onInit();

      fetchData();
      //네트워크 요구
    }

    void fetchData() async {
      var books = await Services.fetchBooks(searchText);
      var searchBookmaps = await Services.fetchBookmaps(searchText);
      if (books != null) {
        bookList.value = books;
        print(books);
      }
      if( searchBookmaps != null){
        bookMapList.value = searchBookmaps;
        print(searchBookmaps);
      }else{
        bookMapList.value = [];
      }
    }

    void onSearchTextChanged(String text) {
      searchText.value = text;
    }


  }