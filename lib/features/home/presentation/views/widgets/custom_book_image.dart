import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
          image: const DecorationImage(
            image: AssetImage(AssetData.testImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
