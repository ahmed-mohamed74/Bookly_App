import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/utils/styles.dart';
import 'package:my_bookly_app/features/home/data/models/BookModel.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/bookin_rate.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';

import 'custom_book_details_appBar.dart';
import 'custom_book_image.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(child: SizedBox(height: 40)),
                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
