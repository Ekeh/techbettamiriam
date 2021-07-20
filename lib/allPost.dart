import 'dart:async';
import 'dart:convert';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:techbetta_app/colors.dart';
import 'package:techbetta_app/strings.dart';
import 'package:techbetta_app/utility/apis.dart';
import 'package:techbetta_app/utility/postConstructor.dart';
import 'package:techbetta_app/utility/globalVariables.dart';
import 'package:techbetta_app/utility/models.dart';
import 'package:techbetta_app/utility/screensAppbar.dart';
import 'package:techbetta_app/viewPost.dart';


class AllPost extends StatefulWidget {
  @override
  _AllPostState createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  List<dynamic> p = <dynamic>[];
      String filter;
  bool progress = false;
  String value;
  static List<MyModel> myAllData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostList();
    GlobalVariables.searchController.addListener(() {
      setState(() {
        filter = GlobalVariables.searchController.text;
      });
    });

  }

  Widget bodyList(int index){
    return PostConstructor(
      id: myAllData[index].id.toString(),
      userId: myAllData[index].userId.toString(),
      title: myAllData[index].title,
      body:myAllData[index].body ,
      postTap: (){
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => ViewPost(postId:myAllData[index].id));


      },
    );
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height);
    return SafeArea(child: Scaffold(
        backgroundColor: kBlackColor,
        appBar: ScreenAppBar(title: KAllCoins,),
        body: ModalProgressHUD(
          inAsyncCall: progress,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [

                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myAllData.length,
                      itemBuilder: (context, int index) {
                        return  filter == null || filter == "" ?bodyList(index):
                        '${myAllData[index].title}'.toLowerCase()
                            .contains(filter.toLowerCase())

                            ?bodyList(index):Container();

                      })

                ],
              ),
            ),
          ),
        )));
  }

  Future<void> getPostList() async {
    //get the list of post
    if(myAllData.length == 0){
      setState(() {
        progress = true;

      });
    }
    try {
      http.Response res = await http.get(ApiCalls.getPostApi);

      if (res.statusCode == 200) {
        List<dynamic>  jsonBody = json.decode(res.body);

        for (dynamic data in jsonBody) {

         myAllData.add(MyModel(
              data['id'],
              data['userId'],
              data['title'],
              data['body'],


          ));
        }


        setState(() {});
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
      GlobalVariables.notifyFlutterToastError(title: kError);    }


  }



}


