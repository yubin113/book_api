import 'package:flutter/material.dart';

import '../model/product_model.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Document book;

  ProductTile(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: 100,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image(
                image: NetworkImage(book.thumbnail),
                alignment: Alignment.center, // 이미지를 중앙으로 정렬
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                      child: Text(
                        '이미지 없음',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ));
                },
              ),
              // child: Image.network(
              //   book.thumbnail != null ? book.thumbnail :  ,
              //   fit: BoxFit.fill,
              // ),
            ),
            SizedBox(width: 8), // 각 요소 사이의 간격 조정
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${book.title}',
                    maxLines: 2,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${book.authors.toString().replaceAll('[', '').replaceAll(
                        ']', '')}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    '${book.contents}',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
