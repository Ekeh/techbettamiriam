import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sticky_headers/sticky_headers.dart';
import 'package:techbetta_app/colors.dart';
import 'package:techbetta_app/dimens.dart';
import 'package:techbetta_app/strings.dart';
import 'package:techbetta_app/utility/apis.dart';
import 'package:techbetta_app/utility/fonts.dart';
import 'package:techbetta_app/utility/postConstructor.dart';
import 'package:techbetta_app/utility/globalVariables.dart';
import 'package:techbetta_app/utility/header.dart';
import 'package:techbetta_app/utility/models.dart';

class ViewPost extends StatefulWidget {
  ViewPost({@required this.postId});
  final dynamic postId;
  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  bool progress = true;
  Widget spacer() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.04);
  }
  Map<String,dynamic> selectedPost;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostSelected();
  }
  Widget space(){
    return SizedBox(height:  MediaQuery.of(context).size.height * 0.02,);
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 600),
            curve: Curves.decelerate,
            child: Container(
              //color: kBlackColor.withOpacity(0.4),
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                    child:   StickyHeader(
                        header:  Header(title:'Post Id: ${ widget.postId.toString().toUpperCase()}'),

                        content:progress?Center(child: CircularProgressIndicator()):Container(
                          margin: EdgeInsets.symmetric(horizontal: kHorizontal),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                space(),
                                RichText(
                                  text: TextSpan(
                                    text: '$kUserId: ',
                                    style: Fonts.titleSize,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: selectedPost['userId'].toString(),
                                        style: Fonts.selectedPostSize,
                                      ),
                                    ],
                                  ),
                                ),
                                space(),
                                Text(kTitle,

                                  style: Fonts.titleSize,
                                ),

                                Text(selectedPost['title'],
                                  style: Fonts.selectedPostSize,
                                ),
                                space(),
                                Divider(),
                                Text(kBody,

                                  style: Fonts.titleSize,
                                ),
                                Text(selectedPost['body'],
                                  style: Fonts.selectedPostSize,
                                ),


                              ],
                            ),
                          )
                        ))))));
  }

  Future<void> getPostSelected() async {
    //get the post that was selected by the user
    setState(() {
      progress = true;
    });
    try {
      http.Response res = await http.get('https://jsonplaceholder.typicode.com/posts/${widget.postId}');

      if (res.statusCode == 200) {

        selectedPost = json.decode(res.body);


        setState(() {
          progress = false;
        });
      } else {
        setState(() {
          progress = false;
        });
        GlobalVariables.notifyFlutterToastError(title: kError);
      }
    }catch(e){
      setState(() {
        progress = false;
      });
      GlobalVariables.notifyFlutterToastError(title: kError);
    }
  }

}
