import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly_app/constants.dart';
import 'package:my_bookly_app/core/utils/app_router.dart';
import 'package:my_bookly_app/features/home/data/models/BookModel.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import '../../../../../core/utils/styles.dart';
import 'booking_rate.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        AppRouter.kBookDetailsView,
        extra: bookModel,
      ),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                      kErrBookImage,
                )),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating:
                            bookModel.volumeInfo.averageRating?.toInt() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
