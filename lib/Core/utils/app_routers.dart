import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Feature/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo_imp.dart';
import 'package:bookly/Feature/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Feature/Search/presentation/views/search_view.dart';
import 'package:bookly/Feature/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Feature/Home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import '../../Feature/Home/presentation/views/home_view.dart';

abstract class AppRouters {
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kBookDetailsView = '/bookDetailsView';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: kSearchView, builder: (context, state) => const SearchView()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ))
  ]);
}
