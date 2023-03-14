import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/widgets/custom_error_widget.dart';
import '../../../../Home/presentation/views/widgets/book_list_view_item.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import '../../view_models/search_cubit/search_state.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBookCubit,SearchedBooksState>(
      builder:(context, state) {
        if(state is SearchedBooksSuccess){
          return Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
               physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BookListViewItem(bookModel: state.books[index],);
                }),
          );
        }else if (state is SearchedBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }else{
          return Container();
        }
      },
    );
  }
}
