import 'package:flutter/material.dart';
import 'package:mvc_practice/constants.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget(
      {Key? key, required this.title, required this.titleDetail})
      : super(key: key);

  final String? title;
  final String? titleDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: kBoldBlueTextStyle,
        ),
        SizedBox(
          width: 5,
        ),
        Text(titleDetail!, style: kBlackTextStyle)
      ],
    );
  }
}
