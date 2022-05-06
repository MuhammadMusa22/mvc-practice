import 'package:flutter/material.dart';
import 'movie_text_details.dart';

class TextRow extends StatelessWidget {
  final String? title1;
  final String? titleDetails1;

  final String? title2;
  final String? titleDetails2;

  TextRow({this.title1, this.titleDetails1, this.title2, this.titleDetails2});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MovieDetailsWidget(
            title: title1,
            titleDetail: titleDetails1,
          ),
          MovieDetailsWidget(
            title: title2,
            titleDetail: titleDetails2,
          ),
        ],
      ),
    );
  }
}
