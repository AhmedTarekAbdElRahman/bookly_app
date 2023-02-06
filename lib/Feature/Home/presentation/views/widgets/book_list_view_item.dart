import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/book_model/book_model.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key,required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.kBookDetailsView,extra: bookModel),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SizedBox(
          height: 125.h,
          child: Row(
            children: [
              CustomBookImage(imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ??''),
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo!.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      bookModel.volumeInfo!.authors![0],
                      style: Styles.textStyle14
                          .copyWith(color: Colors.white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const BookRating()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
