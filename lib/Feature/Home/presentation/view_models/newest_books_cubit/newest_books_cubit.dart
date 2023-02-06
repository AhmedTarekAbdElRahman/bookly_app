import 'package:bookly/Feature/Home/data/repos/home_repo.dart';
import 'package:bookly/Feature/Home/presentation/view_models/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBooksState>{
  NewestBookCubit(this.homeRepo):super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async{
    emit(NewestBooksLoading());
    var result =await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}