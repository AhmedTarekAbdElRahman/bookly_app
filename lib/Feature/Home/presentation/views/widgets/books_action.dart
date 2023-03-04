import 'package:bookly/Core/utils/functions/launch_url.dart';
import 'package:bookly/Core/widgets/custom_button.dart';
import 'package:bookly/Feature/Home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.0.w),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: 'Free',
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              text: getText(bookModel),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              function: () {
                launchCustomUrl(context, bookModel.volumeInfo!.previewLink);
              },
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel model) {
    if (bookModel.volumeInfo!.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
