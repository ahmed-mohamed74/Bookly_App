import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly_app/core/widgets/custom_error_message.dart';
import 'package:my_bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

import '../../../../../constants.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (BuildContext context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              kErrBookImage),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
