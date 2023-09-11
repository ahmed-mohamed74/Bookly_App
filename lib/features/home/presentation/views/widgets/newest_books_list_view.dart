import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly_app/core/widgets/custom_error_message.dart';
import 'package:my_bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

import 'newest_books_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (BuildContext context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: state.newestBooks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.newestBooks[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
