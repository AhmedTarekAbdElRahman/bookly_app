import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly/Feature/Home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Feature/Home/presentation/view_models/similar_books_cubit/similar_books_state.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo!.imageLinks
                                ?.thumbnail ??
                            ''),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
