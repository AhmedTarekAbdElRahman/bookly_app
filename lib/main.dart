import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo_imp.dart';
import 'package:bookly/Feature/Home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Feature/Home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/utils/service_locator.dart';

void main() {
  setupServiceLoactor();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      FeaturedBookCubit(getIt.get<HomeRepoImp>())
                        ..fetchFeaturedBooks()),
              BlocProvider(
                  create: (context) => NewestBookCubit(getIt.get<HomeRepoImp>())
                    ..fetchNewestBooks()),
            ],
            child: MaterialApp.router(
              routerConfig: AppRouters.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: kPrimaryColor,
                textTheme:
                    GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
              ),
            ),
          );
        });
  }
}
