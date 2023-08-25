import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: const [
          Expanded(
              child: CustomButton(
            backGroundColor: Colors.white,
            textColor: Colors.black,
            text: '19.99\$',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            backGroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            text: 'Free Preview',
            fontSize: 16,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }
}
