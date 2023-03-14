import 'package:bookly/Feature/Search/presentation/view_models/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';

class SearchedBookCubit extends Cubit<SearchedBooksState> {
  SearchedBookCubit(this.searchedRepo) : super(SearchedBooksInitial());

  final SearchedRepo searchedRepo;

  Future<void> fetchSearchedBooks(String text) async {
    emit(SearchedBooksLoading());
    var result = await searchedRepo.fetchSearchedBooks(text);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchedBooksSuccess(books));
    });
  }
}
