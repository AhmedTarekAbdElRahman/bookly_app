import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Feature/Home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'home_repo.dart';

class SearchedRepoImp implements SearchedRepo{
  final ApiService _apiService;
  SearchedRepoImp(this._apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(String text) async {
    try{
      var data = await _apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest');
      List<BookModel> books=[];
      List<BookModel> searchedBooks=[];
      for(var item in data['items']){
            books.add(BookModel.fromJson(item));
      }
      searchedBooks=books.where((book) => book.volumeInfo!.title!.toLowerCase().startsWith(text)).toList();
      return right(searchedBooks);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}