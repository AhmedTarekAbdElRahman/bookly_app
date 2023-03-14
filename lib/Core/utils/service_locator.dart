import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Feature/Search/data/repos/home_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLoactor(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchedRepoImp>(SearchedRepoImp(getIt.get<ApiService>()));
}