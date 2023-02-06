import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        SizedBox(
          width: 6.3.w,
        ),
        const Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          '(2390)',
          style:
              Styles.textStyle14.copyWith(color: Colors.white.withOpacity(0.5)),
        )
      ],
    );
  }
}
