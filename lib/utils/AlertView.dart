import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/root/home/model/shop_detail_entity.dart';
import 'AppConfig.dart';

class AlertView extends StatefulWidget {
 var onTap;
 ShopDetailEntity entity;
  AlertView({
    Key key,
    this.onTap,
    this.entity
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AlertViewState();
  }
}

class _AlertViewState extends State<AlertView> {
  bool isBig;  Map<String, dynamic> map;
  @override
  void initState() {
    widget.entity.data.setmeal.forEach((element) {
      print(element.toJson());

    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(

      child: new Column(
        children: <Widget>[
          new Expanded(child: new Container()),
          new Container(

            width: AppConfig.logic_width(700.0),
            child: new Column(
              children: <Widget>[
                Material(
                  child: new Container(

                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    height: AppConfig.logic_width(150),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                              widget.entity.data.smallimages.split(",")[0]),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(


                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        widget.entity.data.title,
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize:
                                                AppConfig.logic_fontSize(25)),
                                      ),
                                      width: double.infinity,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "${widget.entity.data.priceTitle}",
                                        style: TextStyle(
                                            fontSize:
                                                AppConfig.logic_fontSize(25)),
                                      ),
                                      width: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    alignment: Alignment.center,
                  ),
                ),
                AppConfig.lineView(),

                Material(
                    child: new Container(
                  height: AppConfig.logic_width(700.0),
                  alignment: Alignment.centerLeft,
                  child: new CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      new SliverList(
                        delegate: new SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return item(index);
                          },
                          childCount: widget.entity.data.setmeal.length,
                        ),
                      ),
                    ],

//                    child: Column(children: [
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(20, 0,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("主菜",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.orange),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 新疆大盘鸡（1份）                         ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(20, 0,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("热菜 2选1",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.orange),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 辣椒炒牛肉（1份）                         ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 回民羊杂汤（1份）                         ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(20, 0,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("荤菜",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.orange),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 羊肉串（4份）                                 ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(20, 0,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("凉菜",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.orange),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 石河子凉皮（1份）                         ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(20, 0,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("热饮",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.orange),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 新疆奶茶（1份）                             ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(20, 0,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("主食",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.orange),),
//                      ),
//                      Container(
//                        margin: const EdgeInsets.fromLTRB(30, 10,0 , 0),
//
//                        width:double.infinity,
////                        color: Colors.blue,
//                        child: Text("· 手工烤馕（1份）                             ￥78",style: TextStyle(fontSize: AppConfig.logic_width(35,),color: Colors.black),),
//                      ),
//                    ],),
//                    child: new Text("widget.contentText456456456456456456456456456456456456456456456456/n415222222222222222222222222asdasdasdasdasdasd",),
                  ),
                )),
//                Gaps.vGap10,
                AppConfig.lineView(),

                new Container(
                  height: AppConfig.logic_width(80.0),
                  margin: const EdgeInsets.all(10.0),
                  width: AppConfig.logic_width(400.0),
                  alignment: Alignment.center,
                  child: new Material(
                    color: AppConfig.otherColor,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(10.0)),
                    child: new InkWell(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(10.0)),
                      onTap: () {
                        //
                        widget.onTap();
//                        Navigator.push(context, new MaterialPageRoute(builder: (_) => new Shop()));
                      },
                      child: new Center(
                        child: new Text(
                          "查看详情",
                          style: AppConfig.normalTextStyle(
                              Colors.white, AppConfig.logic_fontSize(30)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all( Radius.circular(10.0)),
            ),
          ),
          new Expanded(child: new Container()),
        ],
      ),
    );
  }

  Widget item(index) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),

          width: double.infinity,
//                        color: Colors.blue,
          child: Text(
            "${widget.entity.data.setmeal[index].name}",
            style: TextStyle(
                fontSize: AppConfig.logic_width(
                  30,
                ),
                color: Colors.orange),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          height: AppConfig.logic_height(100)*  widget.entity.data.setmeal[index].configjson.length,

          width: double.infinity,
//                        color: Colors.blue,
          child:ListView.builder(
            itemCount:  widget.entity.data.setmeal[index].configjson.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: ((context,i){
            return Container(
              height: AppConfig.logic_height(100),
              child:
            Row(children: [
              Text(
                widget.entity.data.setmeal[index].configjson[i].name,
                style: TextStyle(
                    fontSize: AppConfig.logic_fontSize(
                      25,
                    ),
                    color: Colors.black),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),

                child:  Text(
                  "￥${widget.entity.data.setmeal[index].configjson[i].price}",
                  style: TextStyle(
                      fontSize: AppConfig.logic_width(
                        25,
                      ),
                      color: Colors.black),
                ) ,)

            ],)
              ,);
          }))


        ),
      ],
    );
  }
}
