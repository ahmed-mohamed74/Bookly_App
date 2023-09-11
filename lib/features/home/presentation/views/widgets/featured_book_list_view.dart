import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly_app/core/widgets/custom_error_message.dart';
import 'package:my_bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (BuildContext context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    ),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              kErrBookImage,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
