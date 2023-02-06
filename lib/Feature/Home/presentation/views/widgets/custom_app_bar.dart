import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logo),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouters.kSearchView);
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
        ],
      ),
    );
  }
}
