import 'package:flutter/material.dart';
import 'package:my_bookly_app/features/home/data/models/BookModel.dart';

import '../../../../../core/utils/styles.dart';
import 'bookin_rate.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.22),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                'https://www.directive.com/images/easyblog_shared/November_2018/11-12-18/human_error_stop_400.png',
          ),
        ),
        const SizedBox(height: 46),
        Text(
          bookModel.volumeInfo.title ?? 'No Name',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16),
        BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            rating: bookModel.volumeInfo.averageRating ?? 0,
            count: bookModel.volumeInfo.ratingsCount ?? 0),
        const SizedBox(height: 37),
        BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
