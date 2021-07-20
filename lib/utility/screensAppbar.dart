
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techbetta_app/colors.dart';
import 'package:techbetta_app/dimens.dart';
import 'package:techbetta_app/utility/fonts.dart';
import 'package:techbetta_app/utility/globalVariables.dart';
class ScreenAppBar extends StatefulWidget with PreferredSizeWidget {
  ScreenAppBar({@required this.title});
  final String title;
  @override
  _ScreenAppBarState createState() => _ScreenAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(56.0);
}

class _ScreenAppBarState extends State<ScreenAppBar> {
  Icon actionIcon =  Icon(Icons.search,color: Colors.grey,size: 25,);
  bool checkSearch = true;
  @override
  Widget build(BuildContext context) {

    return AppBar(

      backgroundColor: kBlackColor,
      title:  checkSearch ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(widget.title,
            style: GoogleFonts.oxanium(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
              color: kOrangeColor,
            ),
          ),
          IconButton(icon: Icon(Icons.search,color: Colors.grey,size: 25,), onPressed: (){
            setState(() {
              checkSearch = false;
            });
          }),


        ],
      ):Container(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(
              child: TextFormField(
                  controller: GlobalVariables.searchController,
                  style: Fonts.textSize,
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: kOrangeColor,
                  keyboardType: TextInputType.text,
                  decoration: GlobalVariables.searchInput),
            ),

            IconButton(icon: Icon(Icons.cancel,color: Colors.grey,size: 25,), onPressed: (){
              setState(() {
                checkSearch = true;
              });
            }),

          ],
        ),
      ),
    );
  }
}



class ScreenAppNoSearch extends StatefulWidget with PreferredSizeWidget {
  ScreenAppNoSearch({@required this.title});
  final String title;
  @override
  _ScreenAppNoSearchState createState() => _ScreenAppNoSearchState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(56.0);
}

class _ScreenAppNoSearchState extends State<ScreenAppNoSearch> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBlackColor,
      title:  Text(widget.title,
        style: GoogleFonts.oxanium(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
          color: kOrangeColor,
        ),
      ),
    );
  }
}
