import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/root/login/LoginPage.dart';
import 'package:shop/utils/BottonClipper.dart';

import '../../utils/AppConfig.dart';
import '../User.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(slivers: [
        new SliverList(
          delegate: new SliverChildListDelegate([
            new Container(
              child:new User().entity==null? header():headerLogin(),
            ),
          ]),
        ),
        new SliverList(
          delegate: new SliverChildListDelegate([
            new Container(
              child: dingdan(),
            ),
          ]),
        ),
//        new SliverList(
//          delegate: new SliverChildListDelegate([
//            new Container(
//              child: zuopin(),
//            ),
//          ]),
//        ),
      ],) ,
    );
  }

  Widget header(){
    return Container(height: AppConfig.logic_width(400),child:
    new Container(


      child: ClipPath(
        clipper: BottonClipper(),
        child: Container(

          child: Column(
            children: [
              Container(height: AppConfig.logic_height(200),
                margin: const EdgeInsets.only(left: 20, right: 20,),
                child:InkWell(child:  Row(children: [
                  InkWell(child:  new ClipOval(
                    child: new Image.network(
                      "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                      width: AppConfig.logic_width(100),
                    ),
                  ), onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginPage()));

                  },),

                  new Expanded(child: new Container()),
                  new Container(
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginPage()));
                      },
                      child: new Row(
                        children: <Widget>[
                          new Text("未登录",
                              style: AppConfig.normalTextStyle(
                                  Colors.white,
                                  AppConfig.font_smallSize)),
                          new Icon(
                            Icons.chevron_right,
                            size: AppConfig.font_bigSize,
                            color:  Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],),onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginPage()));
//
                },)
              ),
//              Padding(padding: EdgeInsets.only(top: 3),child: Divider(
//                color: Colors.white,
//
//              ),),
              Container(
                  padding: const EdgeInsets.only( top: 10),
                height: AppConfig.logic_height(100),
                child: Row(children: [
                  Expanded(child: Container(
                    child: Column(children: [
                      Text("0",style: TextStyle(color: Colors.white)),
                    Text("关注",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),
                  ],),)),
                  Expanded(child: Container(child: Column(children: [
                    Text("0",style: TextStyle(color: Colors.white)),
                    Text("粉丝",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),

                  ],),)),
                  Expanded(child: Container(child: Column(children: [
                    Text("0",style: TextStyle(color: Colors.white)),
                    Text("收藏",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),

                  ],),)),
                  Expanded(child: Container(child: Column(children: [
                    Text("0",style: TextStyle(color: Colors.white)),
                    Text("被赞与采集",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),

                  ],),)),

              ],),)
//              Container(
//                margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
//                child:    Card(
//                  color: Colors.orangeAccent,
//                child: Container(
//                  width: double.infinity,
//                  child: Column(
//                    children: [],
//                  ),
//                ),
//              ),
//              height: AppConfig.logic_height(150),
//              )

            ],
          ) ,
//          color: Color(0xFFFFB6C1),
          color: Colors.red,

          height: AppConfig.logic_width(100),
        ),
      ),
    ),);
  }
  Widget headerLogin(){
    return Container(height: AppConfig.logic_width(400),child:
    new Container(


      child: ClipPath(
        clipper: BottonClipper(),
        child: Container(

          child: Column(
            children: [
              Container(height: AppConfig.logic_height(200),
                  margin: const EdgeInsets.only(left: 20, right: 20,),
                  child:InkWell(child:  Row(children: [
                    InkWell(child:  new ClipOval(
                      child: new Image.network(
                        new User().entity.data.userinfo.avatar,
                        width: AppConfig.logic_width(100),
                      ),
                    ), onTap: (){
//                      Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginPage()));

                    },),

                    new Expanded(child: new Container(
                      margin: const EdgeInsets.only(left: 20, ),

                      child: Text( new User().entity.data.userinfo.nickname,style: TextStyle(color: Colors.white),),)),
//                    new Container(
//                      child: new GestureDetector(
//                        onTap: () {
//                          Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginPage()));
//                        },
//                        child: new Row(
//                          children: <Widget>[
//                            new Text("未登录",
//                                style: AppConfig.normalTextStyle(
//                                    Colors.white,
//                                    AppConfig.font_smallSize)),
//                            new Icon(
//                              Icons.chevron_right,
//                              size: AppConfig.font_bigSize,
//                              color:  Colors.white,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                  ],),onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (_) => new LoginPage()));
//
                  },)
              ),
//              Padding(padding: EdgeInsets.only(top: 3),child: Divider(
//                color: Colors.white,
//
//              ),),
              Container(
                padding: const EdgeInsets.only( top: 10),
                height: AppConfig.logic_height(100),
                child: Row(children: [
                  Expanded(child: Container(
                    child: Column(children: [
                      Text("0",style: TextStyle(color: Colors.white)),
                      Text("关注",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),
                    ],),)),
                  Expanded(child: Container(child: Column(children: [
                    Text("0",style: TextStyle(color: Colors.white)),
                    Text("粉丝",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),

                  ],),)),
                  Expanded(child: Container(child: Column(children: [
                    Text("0",style: TextStyle(color: Colors.white)),
                    Text("收藏",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),

                  ],),)),
                  Expanded(child: Container(child: Column(children: [
                    Text("0",style: TextStyle(color: Colors.white)),
                    Text("被赞与采集",style: TextStyle(color: Colors.white,fontSize: AppConfig.logic_fontSize(25)),),

                  ],),)),

                ],),)
//              Container(
//                margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
//                child:    Card(
//                  color: Colors.orangeAccent,
//                child: Container(
//                  width: double.infinity,
//                  child: Column(
//                    children: [],
//                  ),
//                ),
//              ),
//              height: AppConfig.logic_height(150),
//              )

            ],
          ) ,
//          color: Color(0xFFFFB6C1),
          color: Colors.red,

          height: AppConfig.logic_width(100),
        ),
      ),
    ),);
  }

  Widget dingdan(){
    return Container(
      alignment: Alignment.center,
      height: AppConfig.logic_width(250),child:Card(child: Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
      new Row(
        children: <Widget>[

          new Container(
            padding: const EdgeInsets.only(left: 10.0,top: 10.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              "我的订单",
              style: AppConfig.normalTextStyle(
                  AppConfig.fontDarkColor, AppConfig.font_midSize),
            ),
          ),
          new Expanded(child: new Container()),
          new Container(
            padding: const EdgeInsets.only(top: 10.0,right: 10.0),

            child: new GestureDetector(
              onTap: () {
                ///分类点击事件
              },
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.chevron_right,
                    size: AppConfig.font_bigSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Padding(padding: EdgeInsets.only(top: 3),child: Divider(
        height: 0.2,
        color: Colors.black12,

      ),),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only( top: 15),
        height: AppConfig.logic_height(150),
        child: Row(children: [
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
              Icon(Icons.assignment,color: Colors.black54),
              Text("我的订单",style: TextStyle(fontSize: AppConfig.logic_fontSize(25),color: Colors.black54),),
            ],),)),
          Expanded(child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            Icon(Icons.query_builder,color: Colors.black54),
            Container(
              alignment: Alignment.center,
             child: Text("待使用",style: TextStyle(fontSize: AppConfig.logic_fontSize(25),color: Colors.black54,),textAlign: TextAlign.center,),),

          ],),)),
          Expanded(child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            Icon(Icons.question_answer ,color: Colors.black54),
            Text("待评价",style: TextStyle(fontSize: AppConfig.logic_fontSize(25),color: Colors.black54),),

          ],),)),
          Expanded(child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Icon(Icons.account_balance_wallet,color: Colors.black54),
            Text("退款/售后",style: TextStyle(color: Colors.black54,fontSize: AppConfig.logic_fontSize(25)),),

          ],),)),

        ],),)
    ],) ,),);
  }


  Widget zuopin(){
    return Container(height: AppConfig.logic_width(300),child:Card(child: Column(children: [
      new Row(
        children: <Widget>[
          new Container(
          ),
          new Container(
            padding: const EdgeInsets.only(left: 10.0,top: 10.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              "我的作品",
              style: AppConfig.normalTextStyle(
                  AppConfig.fontDarkColor, AppConfig.font_midSize),
            ),
          ),
          new Expanded(child: new Container()),
          new Container(
            padding: const EdgeInsets.only(top: 10.0,right: 10.0),

            child: new GestureDetector(
              onTap: () {
                ///分类点击事件
              },
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.chevron_right,
                    size: AppConfig.font_bigSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Padding(padding: EdgeInsets.only(top: 3),child: Divider(
        height: 0.2,
        color: Colors.black12,
      ),)
    ],) ,),);
  }
}
