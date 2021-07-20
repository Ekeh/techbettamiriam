

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techbetta_app/colors.dart';
import 'package:techbetta_app/dimens.dart';

class Fonts{


  static final textSize = GoogleFonts.oxanium(
      textStyle:TextStyle(
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kWhiteColor,
  ));

  static final titleSize = GoogleFonts.oxanium(
      textStyle:TextStyle(
        decoration: TextDecoration.underline,
    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kGreyColor,
  ));

  static final postSize = TextStyle(

    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kWhiteColor,
  );


  static final selectedPostSize = TextStyle(

    fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
    color: kBlackColor,
  );


}