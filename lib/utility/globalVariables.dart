
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techbetta_app/colors.dart';
import 'package:techbetta_app/dimens.dart';
import 'package:techbetta_app/utility/models.dart';

class GlobalVariables{
//for searching coins
  static TextEditingController searchController = TextEditingController();

  static List<SelectedCoinModel> selectedCoin = [];
  /// search decoration
  static final searchInput = InputDecoration(
    prefixIcon: Icon(Icons.search,color: kOrangeColor,),
    hintText: "Search...",
    hintStyle:GoogleFonts.oxanium(
      fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
      color: kHintColor,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide:
      BorderSide(color: kOrangeColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kOrangeColor),


    ),
    border:
    OutlineInputBorder(borderSide: BorderSide(color: kBlackColor)),
  );



  static notifyFlutterToastError({@required title})async{
    // String title;
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: kRedColor,
        textColor: kWhiteColor);
  }
  static notifyFlutterToastSuccess({@required title})async{
    // String title;
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: kWhiteColor );
  }
}