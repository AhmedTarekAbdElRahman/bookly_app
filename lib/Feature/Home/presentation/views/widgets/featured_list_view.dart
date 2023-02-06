import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Feature/Home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Feature/Home/presentation/view_models/featured_books_cubit/featured_books_state.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_routers.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit,FeaturedBooksState>(
      builder: (context,state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: GestureDetector(
                        onTap: () => GoRouter.of(context).push(AppRouters.kBookDetailsView,extra: state.books[index]),
                        child: CustomBookImage(imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail??'')),
                  );
                }),
          );
        }else if(state is FeaturedBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      }
    );
  }
}
