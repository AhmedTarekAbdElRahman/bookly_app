import 'package:bookly/Feature/Home/data/repos/home_repo_imp.dart';
import 'package:bookly/Feature/Search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/service_locator.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: TextField(
        controller: searchController,
        cursorColor: Colors.white,
        onChanged: (searchedBook){
//           SearchedBookCubit(getIt.get<HomeRepoImp>()).fetchSearchedBooks(searchController.text);
         BlocProvider.of<SearchedBookCubit>(context).fetchSearchedBooks(searchController.text);
        },
        decoration: InputDecoration(
            hintText: 'search',
            suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder()
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }

}
