import 'package:bookly/Feature/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(book: bookModel),
              Expanded(
                child: SizedBox(
                  height: 50.h,
                ),
              ),
              const SimilarBooksSection(),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        )
      ],
    );
  }
}
