import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/utils/function/launch_url.dart';
import 'package:my_bookly_app/core/widgets/custom_button.dart';
import 'package:my_bookly_app/features/home/data/models/BookModel.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, bookModel.accessInfo?.webReaderLink);
            },
            backGroundColor: Colors.white,
            textColor: Colors.black,
            text: 'FREE',
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink);
            },
            backGroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            text: getText(bookModel),
            fontSize: 16,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
