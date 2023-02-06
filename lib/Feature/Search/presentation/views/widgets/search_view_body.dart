import 'package:bookly/Feature/Search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Feature/Search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSearchTextField(),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 16.h,bottom: 16.h),
          child: const Text(
            'Search Results',
            style: Styles.textStyle18,
          ),
        ),
        const SearchListView()
      ],
    );
  }
}

