import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlevel2/view/product_tile.dart';
import 'package:getxlevel2/view/search_bookmap_tile.dart';

import '../controller/controller.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());
  PageController _pageController = PageController();

  Widget _searchTab() {
    return Center(
      child: Container(
        width: 320,
        height: 40,
        margin: EdgeInsets.only(bottom: 0),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                width: 150,
                height: 40,
                margin: EdgeInsets.only(bottom: 0),
                padding: EdgeInsets.all(0),
                decoration: controller.tabStatus.value ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2)),
                    ],
                ):BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "도서",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                controller.toggleTabs();
              },
            ),
            GestureDetector(
              child: Container(
                width: 150,
                height: 40,
                margin: EdgeInsets.only(bottom: 0),
                padding: EdgeInsets.all(0),
                decoration: controller.tabStatus.value?BoxDecoration()
                :BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "북맵",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                controller.toggleTabs();
              },
            )
          ],
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  controller.onSearchTextChanged(text); // 검색어 변경 콜백, 'text'가 입력한 텍스트입니다.
                },
                onEditingComplete: (){
                  controller.fetchData();
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: '검색어를 입력하세요',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Center(
                child: Obx(() =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _searchTab(),
                      ],
                    ),
                ),
              ),
              Expanded(
                child: Obx(
                      () => controller.tabStatus.value == true ? ListView.builder(
                    itemCount: controller.bookList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(controller.bookList[index]);
                    },
                  ) : ListView.builder(
                        itemCount: controller.bookMapList.length,
                        itemBuilder: (context, index) {
                          return SearchBookMapTile(controller.bookMapList[index]);
                        },
                      ) ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
