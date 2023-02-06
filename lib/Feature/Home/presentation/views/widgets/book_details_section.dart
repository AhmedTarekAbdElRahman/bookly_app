import 'package:bookly/Feature/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/styles.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.3.w),
          child: CustomBookImage(imageUrl: book.volumeInfo!.imageLinks?.thumbnail ??''),
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          book.volumeInfo!.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          book.volumeInfo!.authors![0],
          style:
              Styles.textStyle18.copyWith(color: Colors.white.withOpacity(0.7)),
        ),
        SizedBox(
          height: 16.h,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(
          height: 37.h,
        ),
        const BooksAction(),
      ],
    );
  }
}
