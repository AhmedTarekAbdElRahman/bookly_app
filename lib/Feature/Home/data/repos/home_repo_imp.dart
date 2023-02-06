import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Feature/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo{
  final ApiService _apiService;
  HomeRepoImp(this._apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try{
      var data = await _apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest');
      List<BookModel> books=[];
      for(var item in data['items']){
            books.add(BookModel.fromJson(item));
      }
      return right(books);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try{
      var data = await _apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try{
      var data = await _apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=relevance:$category');
      List<BookModel> books=[];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}