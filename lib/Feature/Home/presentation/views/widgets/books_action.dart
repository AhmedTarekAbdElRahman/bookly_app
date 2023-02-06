import 'package:bookly/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.0.w),
      child: Row(
        children: const [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: 'Free',
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              fontSize: 16,
              backgroundColor: Color(0xffEF8262),
              text: 'Preview',
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
