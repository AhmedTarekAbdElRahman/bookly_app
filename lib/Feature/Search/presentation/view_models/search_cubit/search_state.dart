import '../../../../Home/data/model/book_model/book_model.dart';

abstract class SearchedBooksState{}

class SearchedBooksInitial extends SearchedBooksState{}

class SearchedBooksLoading extends SearchedBooksState{}
class SearchedBooksSuccess extends SearchedBooksState{
  final List<BookModel> books;
  SearchedBooksSuccess(this.books);
}
class SearchedBooksFailure extends SearchedBooksState{
  final String errMessage;
  SearchedBooksFailure(this.errMessage);
}