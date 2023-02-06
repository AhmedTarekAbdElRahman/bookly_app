import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: TextField(
        cursorColor: Colors.white,
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
