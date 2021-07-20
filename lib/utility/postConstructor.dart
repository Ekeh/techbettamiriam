
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techbetta_app/colors.dart';
import 'package:techbetta_app/dimens.dart';
import 'package:techbetta_app/strings.dart';
import 'package:techbetta_app/utility/fonts.dart';

class PostConstructor extends StatelessWidget {
  PostConstructor({@required this.id, @required this.userId,@required this.title,@required this.body,@required this.postTap});
  final dynamic id;
  final dynamic userId;
  final dynamic title;
  final dynamic body;
  final Function postTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: postTap,
      child: Card(

        color: kListView,
        elevation: 4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kHorizontal,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kOrangeColor
                ),
                child: Center(
                  child: Text(id.toUpperCase(),
                    style: Fonts.postSize,
                  ),
                ),
              ),
              Divider(),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '$kUserId: ',
              style: Fonts.titleSize,
              children: <TextSpan>[
                TextSpan(
                  text: userId,
                  style: Fonts.postSize,
                ),
              ],
            ),
          ),
              Divider(),
              Text(kTitle,

                style: Fonts.titleSize,
              ),

              Text(title,
                style: Fonts.postSize,
              ),
              Divider(),
              Text(kBody,

                style: Fonts.titleSize,
              ),
              Text(body,
                style: Fonts.postSize,
              ),


            ],
          ),
        )



      ),
    );
  }
}




class Headings extends StatelessWidget {
  Headings({@required this.title});
  final dynamic title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: GoogleFonts.oxanium(
          decoration: TextDecoration.underline,
          textStyle:TextStyle(
            fontSize: ScreenUtil().setSp(kFontSize, allowFontScalingSelf: true),
            color: Colors.blueAccent,
          )),
    );
  }
}
