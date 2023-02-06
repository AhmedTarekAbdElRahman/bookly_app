import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/newest_list_view.dart';
import 'package:bookly/Feature/Home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const FeaturedBooksListView(),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 50.h),
                child: const Text(
                  'Newest Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: NewestListView(),
        )
      ],
    );
  }
}
