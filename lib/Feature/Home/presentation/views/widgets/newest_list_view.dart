import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly/Feature/Home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Feature/Home/presentation/view_models/newest_books_cubit/newest_books_state.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit,NewestBooksState>(
      builder:(context, state) {
        if(state is NewestBooksSuccess){
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return BookListViewItem(bookModel: state.books[index],);
              });
        }else if (state is NewestBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
