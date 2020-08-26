import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop/root/home/model/shop_detail_entity.dart';
import 'package:shop/utils/AppConfig.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class DetailPage extends StatefulWidget {
  ShopDetailEntity  entity;

  DetailPage(this.entity);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int height=0;
  // String str ='"<font color="#888888">交易全程在闲鱼，</font><strong><font color="#F54444">你敢买，我敢赔！</font></strong><font color="#888888">若遇欺诈造成</font><strong><font color="#F54444">钱货两失，可获赔</font></strong><strong><font color="#F54444">最高5000元</font></strong>"';
  var kHtml = '''<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>

''';
List<Widget> tags =new List();
  @override
  void initState() {
    height=widget.entity.data.setmeal.length;
for(int i =0;i<widget.entity.data.setmeal.length;i++){
   height=height+ widget.entity.data.setmeal[i].configjson.length;
}

    widget.entity.data.manystoretaps.forEach((element) {
        tags.add( Container(
          alignment: Alignment.center,
          child: Text("${element.name}",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.red,
                fontSize:
                AppConfig.logic_fontSize(
                    18)),
          ),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)),
            border: new Border.all(
                width: AppConfig.logic_width(2),
                color: Colors.red),
          ),
          margin: EdgeInsets.all(
              AppConfig.logic_width(20)),
          height: AppConfig.logic_width(40),
          width: AppConfig.logic_width(100),
        ),);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
//          leading:  Text('大玩家【227店通用】',style: TextStyle(fontSize:AppConfig.logic_fontSize(15)),),
              pinned: false,
              expandedHeight: AppConfig.logic_height(500),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
//              title:  Text('大玩家【227店通用】',style: TextStyle(fontSize:AppConfig.logic_fontSize(15)),),
                  background: header()),
            ),

            ///标题
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  child: Text(
                    "${widget.entity.data.subtitle}",
                    style: TextStyle(
                      fontSize: AppConfig.logic_fontSize(35),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.all(AppConfig.logic_width(20)),
                ),
              ]),
            ),

            ///信息
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: AppConfig.logic_width(20)),
                                child: Column(
                                  children: [
                                    Row(children: tags,
//                                      children: [
//                                        tags.toList();
////                                        Container(
////                                          alignment: Alignment.center,
////                                          child: Text(
////                                            "全国通用",
////                                            textAlign: TextAlign.right,
////                                            style: TextStyle(
////                                                color: Colors.red,
////                                                fontSize:
////                                                    AppConfig.logic_fontSize(
////                                                        18)),
////                                          ),
////                                          decoration: new BoxDecoration(
////                                            borderRadius: BorderRadius.all(
////                                                Radius.circular(5.0)),
////                                            border: new Border.all(
////                                                width: AppConfig.logic_width(2),
////                                                color: Colors.red),
////                                          ),
////                                          margin: EdgeInsets.all(
////                                              AppConfig.logic_width(20)),
////                                          height: AppConfig.logic_width(40),
////                                          width: AppConfig.logic_width(100),
////                                        ),
////                                        Container(
////                                          alignment: Alignment.center,
////                                          child: Text(
////                                            "项目丰富",
////                                            textAlign: TextAlign.right,
////                                            style: TextStyle(
////                                                color: Colors.red,
////                                                fontSize:
////                                                    AppConfig.logic_fontSize(
////                                                        18)),
////                                          ),
////                                          decoration: new BoxDecoration(
////                                            borderRadius: BorderRadius.all(
////                                                Radius.circular(5.0)),
////                                            border: new Border.all(
////                                                width: AppConfig.logic_width(2),
////                                                color: Colors.red),
////                                          ),
////                                          margin: EdgeInsets.all(
////                                              AppConfig.logic_width(20)),
////                                          height: AppConfig.logic_width(40),
////                                          width: AppConfig.logic_width(100),
////                                        ),
////                                        Container(
//////                        padding: EdgeInsets.only(left: AppConfig.logic_width(1)),
////                                          alignment: Alignment.center,
////                                          child: Text(
////                                            "全国通用",
////                                            textAlign: TextAlign.right,
////                                            style: TextStyle(
////                                                color: Colors.red,
////                                                fontSize:
////                                                    AppConfig.logic_fontSize(
////                                                        18)),
////                                          ),
////                                          decoration: new BoxDecoration(
////                                            borderRadius: BorderRadius.all(
////                                                Radius.circular(5.0)),
////                                            border: new Border.all(
////                                                width: AppConfig.logic_width(2),
////                                                color: Colors.red),
////                                          ),
////                                          margin: EdgeInsets.all(
////                                              AppConfig.logic_width(20)),
////                                          height: AppConfig.logic_width(40),
////                                          width: AppConfig.logic_width(100),
////                                        ),
//                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(AppConfig.logic_width(10)),

                                      alignment: Alignment.centerLeft,
                                      child: HtmlWidget( widget.entity.data.rightsandinterestscontent,),
                                    ),
                                    Container(
//                        margin: EdgeInsets.only(left: AppConfig.logic_width(20)),
                                      height: AppConfig.logic_height(100),
                                      child: Row(
                                        children: [
                                          Text(
                                            "￥",
                                            style: TextStyle(
                                                fontSize:
                                                    AppConfig.logic_fontSize(
                                                        15),
                                                color: Colors.red),
                                          ),
                                          Text(
                                            "${widget.entity.data.price}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    AppConfig.logic_fontSize(
                                                        45),
                                                color: Colors.red),
                                          ),
                                          Text(
                                            "￥${widget.entity.data.originalPrice}",
                                            style: TextStyle(
                                                fontSize:
                                                    AppConfig.logic_width(25),
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ))),
                      ],
                    ),
                  ),

//              height: AppConfig.logic_height(220),
                  margin: EdgeInsets.all(AppConfig.logic_width(20)),
                ),
              ]),
            ),

            ///套餐
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  margin: EdgeInsets.only(
                      left: AppConfig.logic_width(20),
                      right: AppConfig.logic_width(20)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "到店套餐",
                          style: TextStyle(
                            fontSize: AppConfig.logic_fontSize(35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Expanded(child: new Container()),
//                      new Container(
//                        child: new GestureDetector(
//                          onTap: () {
//                            ///分类点击事件
//                          },
//                          child: new Row(
//                            children: <Widget>[
//                              new Text("查看全部",
//                                  style: TextStyle(
//                                      fontSize: AppConfig.logic_fontSize(20))),
//                              new Icon(
//                                Icons.chevron_right,
//                                size: AppConfig.font_bigSize,
////                          color: AppConfig.widgetColor,
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
                    ],
                  ),

//              height: AppConfig.logic_height(90),
                ),
              ]),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: AppConfig.logic_width(20)),
//                    height: AppConfig.logic_height(150)*3,
                                child: Column(
                                  children: [
                                    Container(
                                        height: AppConfig.logic_height(100) *height,
                                        alignment: Alignment.centerLeft,
                                        child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: widget.entity.data.setmeal.length,
                                            itemBuilder: ((context, index) {
                                              return item(index);
                                            }))),
                                  ],
                                ))),
//                Expanded(child: Container()),
                      ],
                    ),
                  ),

//              height: AppConfig.logic_height(470),
                  margin: EdgeInsets.all(AppConfig.logic_width(20)),
                ),
              ]),
            ),

            ///权益说明
//            new SliverList(
//              delegate: new SliverChildListDelegate([
//                new Container(
//
//                  child:HtmlWidget(
//              widget.entity.data.rightsandinterestscontent,
//              ),
////                  child: Text(
////                      "权益说明\n· 套餐内容：1大1小门票+儿童套餐畅玩不限时（周一至周五可用，节假日不可用）\n· 儿童餐：主食（小馄饨/面条2选1）+卡通包2个+水果1份+南瓜粥1杯\n· 因门店预约火爆，为避免约满状态，请提前一天预约· 每个用户限购2份\n· 额外成人：额外的大人入园需另付50元/人\n· 适用儿童：1-8岁儿童，餐食与游玩票需在游玩当天使用完毕\n· 请勿携带外食进入餐厅，宝宝辅食类除外\n· 本套餐不与店内其他优惠活动同享\n· 3岁以下儿童需穿纸尿裤入场游玩\n· 为保证游乐区环境安全整洁，大人孩子都需要脱鞋穿袜哦，如果忘穿了亦可现场购买\n· 如遇现场客流高峰期，可能需要等位\n· 如部分菜品因时令等不可抗因素导致无法提供，商家会用等价菜品代替，具体请与商家协商\n· 价值仅供参考，实际价格以门店菜单为准"),
//                  margin: EdgeInsets.all(AppConfig.logic_width(20)),
//                ),
//              ]),
//            ),

            ///适用门店
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  margin: EdgeInsets.only(
                      left: AppConfig.logic_width(20),
                      right: AppConfig.logic_width(20)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "适用门店",
                          style: TextStyle(
                            fontSize: AppConfig.logic_fontSize(35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Expanded(child: new Container()),
                    ],
                  ),
                  height: AppConfig.logic_height(90),
                ),
              ]),
            ),

            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin:
                              EdgeInsets.only(left: AppConfig.logic_width(20)),
//                          color: Colors.red,
                          child: Image.network(
                          widget.entity.data.manystore.image,
                            height: AppConfig.logic_width(100),
                            width: AppConfig.logic_width(100),
                          ),
                        )),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppConfig.logic_width(20)),
//                          color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.entity.data.manystore.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                 widget.entity.data.manystore.address,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: AppConfig.logic_fontSize(20)),
                                )
                              ],
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                            child: Container(
                          margin:
                              EdgeInsets.only(left: AppConfig.logic_width(20)),
//                          color: Colors.red,
                          child: Icon(
                            Icons.phone,
                            color: Colors.red,
                          ),
                        )),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(AppConfig.logic_width(10)),
                ),
              ]),
            ),

//            new SliverList(
//              delegate: new SliverChildListDelegate([
//                new Container(
//                  child: HtmlWidget(
//                    kHtml,
//                  ),
//                ),
//              ]),
//            ),

            ///体验shi
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  margin: EdgeInsets.only(
                      left: AppConfig.logic_width(20),
                      right: AppConfig.logic_width(20)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
//                  height: AppConfig.logic_width(30.0),
//                  width: AppConfig.logic_width(6.0),
//                    color: AppConfig.widgetColor,
                          ),
                      new Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "体验师推荐",
                          style: TextStyle(
                            fontSize: AppConfig.logic_fontSize(35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Expanded(child: new Container()),
                      new Container(
                        child: new GestureDetector(
                          onTap: () {
                            ///分类点击事件
                          },
                          child: new Row(
                            children: <Widget>[
                              new Text("查看全部",
                                  style: TextStyle(
                                      fontSize: AppConfig.logic_fontSize(20))),
                              new Icon(
                                Icons.chevron_right,
                                size: AppConfig.font_bigSize,
//                          color: AppConfig.widgetColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: AppConfig.logic_height(90),
                ),
              ]),
            ),

            SliverToBoxAdapter(
              child: Container(
                height: AppConfig.logic_width(700),
//                margin: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(width:  AppConfig.logic_width(600), height: AppConfig.logic_width(700),
                    child: Container(
                      child: Card(child: Container(
                          child: Column(
                            children: [
                            Expanded(child: Container(

                              alignment: Alignment.centerLeft,
                              child: Row(

                              children: [
                           Container(
                             
                               width: AppConfig.logic_width(100),
                               height:  AppConfig.logic_width(100),
                               decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   image: DecorationImage(
                                       image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                                       fit: BoxFit.cover
                                   )
                               ),
                             margin: EdgeInsets.only(left: AppConfig.logic_width(20)),


                           ),

                              Expanded(child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Expanded(child:  Container(
                                    margin: EdgeInsets.only(top: AppConfig.logic_height(10)),
                                    alignment: Alignment.centerLeft,
                                    child: Text("不会蹦跶的露露",textAlign: TextAlign.center,style: TextStyle(fontSize: AppConfig.logic_fontSize(20), fontWeight: FontWeight.bold,),),)),
                                 Expanded(child: Container())
                                ],),

                              ),)
                            ],),),flex: 1,),
                            Expanded(child: Container(color: Colors.blue,child: Row(
                              children: [
                                Expanded(child: Container(color: Colors.red,
                                child: Image.network("http://static.caibeike.com/i/30667bfefd1b8a763d8d334901c613be-fi6H8b-bAOMwbAOMhj2@!s640p",fit: BoxFit.fitWidth,),
                                ),flex: 2,),
                                Expanded(child: Container(color: Colors.yellow,child: Column(

                                  children: [
                                  Expanded(child: Container(
                                width:double.infinity,
                                    child: Image.network("http://static.caibeike.com/i/65c85b43cec0747e0585fc38c15c7d26-cKbNms-bMgCwbAOMhj2@!s640p",fit: BoxFit.fitWidth),),),
                                  Expanded(child: Container(
                                    width:double.infinity,

                                    child: Image.network("http://static.caibeike.com/i/65c85b43cec0747e0585fc38c15c7d26-cKbNms-bMgCwbAOMhj2@!s640p",fit: BoxFit.fitWidth),),)
                                ],),),flex: 1,),
                              ],
                              
                            ),),flex: 3,),
                              Expanded(child: Container(
                                padding: EdgeInsets.all(AppConfig.logic_width(20)),
                                child: Text("遛娃模式开启|家门口性价比超高的儿童乐园🌻时间匆匆又到了宝妈们开始忙碌遛娃的暑期时光了。👸大小姐在家没有安静多久就吵闹着想要出去玩。特殊时期不想去太远或者人多的地方🎠  家门口的中环百联新开了一家金宝贝探索小镇看着还不错那就带娃走起。",maxLines: 3,style: TextStyle(fontSize: AppConfig.logic_fontSize(20)),
                                ),)),
                              Expanded(child: Container(child:  Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: new ClipOval(
                                      child: new Image.network(
                                        "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                                        width: AppConfig.logic_width(50),
                                      ),
                                    ),
                                  ),
                                  new ClipOval(
                                    child: new Image.network(
                                      "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                                      width: AppConfig.logic_width(50),
                                    ),
                                  ),
                                  new ClipOval(
                                    child: new Image.network(
                                      "http://static.caibeike.com/i/83f0eeea35ed3d6e9638be0f73c2797b-IzI0dN-bMOMwOOkhp1@!c300",
                                      width: AppConfig.logic_width(50),
                                    ),
                                  ),
                                  Container(child: Text("13人点赞"),),
                                  Expanded(child: Container()),

                                  Container(child:Icon(Icons.favorite_border,size: AppConfig.logic_fontSize(25),),),
                                  Container(margin:EdgeInsets.only(right: AppConfig.logic_fontSize(18)),child: Text("1060",style: TextStyle(fontSize: AppConfig.logic_fontSize(25)),),)
                                ],
                              ),),flex: 1,),

                            ],),

                    ),),),

                    );
//                    return Stack(
//                      children: [
//                        Container(
//                          width: AppConfig.logic_width(700),
//                          child: Card(
//                            child: Container(
//                              child: Column(
//                                children: [
//                                  Container(
//                                    child: Container(
//                                      margin: const EdgeInsets.only(
//                                          left: 70, top: 5.0, right: 10.0),
//                                      width: double.infinity,
//                                      child: Text("可爱的修啊忽悠"),
//                                    ),
//                                  ),
//                                  Positioned(
//
//                                    child:  Container(
//                                      height: AppConfig.logic_width(300),
//
//                                      child: Container(
//                                        width: double.infinity,
//
//                                        child: Image.network(
//                                          "http://static.caibeike.com/i/b8a8b68fe1cbeb0acab5414d50af1cf7-ihaiBd@!s640",                                  width: double.infinity,
//                                          fit: BoxFit.cover, ),
//                                      ),
//                                    ),)
//                                ],
//                              ),
//                            ),
//                          ),
//                          height: AppConfig.logic_width(900),
//                        ),
////                        Positioned(
////                          child: new ClipOval(
////                            child: new Image.network(
////                              "http://static.caibeike.com/i/3f1b9cd743cba4f112d688e32b6c82dc-AWSZgR@!c150",
////                              width: AppConfig.logic_width(100),
////                            ),
////                          ),
////                          left: AppConfig.logic_width(
////                            20,
////                          ),
////                        )
//                      ],
//                    );
                  },
                ),
              ),
            ),
            ///图文详情
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  margin: EdgeInsets.only(
                      left: AppConfig.logic_width(20),
                      right: AppConfig.logic_width(20)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
//                  height: AppConfig.logic_width(30.0),
//                  width: AppConfig.logic_width(6.0),
//                    color: AppConfig.widgetColor,
                      ),
                      new Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "图文详情",
                          style: TextStyle(
                            fontSize: AppConfig.logic_fontSize(35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Expanded(child: new Container()),
//                      new Container(
//                        child: new GestureDetector(
//                          onTap: () {
//                            ///分类点击事件
//                          },
//                          child: new Row(
//                            children: <Widget>[
//                              new Text("查看全部",
//                                  style: TextStyle(
//                                      fontSize: AppConfig.logic_fontSize(20))),
//                              new Icon(
//                                Icons.chevron_right,
//                                size: AppConfig.font_bigSize,
////                          color: AppConfig.widgetColor,
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                  height: AppConfig.logic_height(90),
                ),
              ]),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(

                  child: HtmlWidget(
                    widget.entity.data.content,
                  ),
                  padding: EdgeInsets.all(AppConfig.logic_width(10)),
                ),
              ]),
            ),
            ///免责说明
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  margin: EdgeInsets.only(
                      left: AppConfig.logic_width(20),
                      right: AppConfig.logic_width(20)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
//                  height: AppConfig.logic_width(30.0),
//                  width: AppConfig.logic_width(6.0),
//                    color: AppConfig.widgetColor,
                      ),
                      new Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          "免责说明",
                          style: TextStyle(
                            fontSize: AppConfig.logic_fontSize(35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Expanded(child: new Container()),
//                      new Container(
//                        child: new GestureDetector(
//                          onTap: () {
//                            ///分类点击事件
//                          },
//                          child: new Row(
//                            children: <Widget>[
//                              new Text("查看全部",
//                                  style: TextStyle(
//                                      fontSize: AppConfig.logic_fontSize(20))),
//                              new Icon(
//                                Icons.chevron_right,
//                                size: AppConfig.font_bigSize,
////                          color: AppConfig.widgetColor,
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                  height: AppConfig.logic_height(90),
                ),
              ]),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate([
                new Container(
                  padding: EdgeInsets.all(AppConfig.logic_width(10)),

                  child: HtmlWidget(
                    widget.entity.data.mianzecontent,
                  ),
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: AppConfig.logic_width(20)),
                  height: AppConfig.logic_height(100),
                  child: Row(
                    children: [
                      Text(
                        "￥",
                        style: TextStyle(
                            fontSize: AppConfig.logic_fontSize(15),
                            color: Colors.red),
                      ),
                      Text(
                        "${widget.entity.data.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppConfig.logic_fontSize(45),
                            color: Colors.red),
                      ),
                      Text(
                        "￥${widget.entity.data.originalPrice}",
                        style: TextStyle(
                            fontSize: AppConfig.logic_width(25),
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: AppConfig.logic_height(100),
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFFFB6C1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.red,
                                  size: AppConfig.logic_fontSize(30),
                                ),
                              ),
                              Container(
                                child: Text("vip微信群",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize:
                                            AppConfig.logic_fontSize(20))),
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: AppConfig.logic_height(100),
                          color: Colors.red,
                          child: Text(
                            "一键下单",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        flex: 2,
                      )
                    ],
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          ),
        ),
        floatingActionButton:FloatingActionButton(onPressed: (){

        }, tooltip: '上传',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),

        backgroundColor: Colors.red,

        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }

  Widget header() {
    return Container(
      height: AppConfig.logic_width(610.0),
      child: Stack(
        children: [
          Container(
            height: AppConfig.logic_width(610.0),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  widget.entity.data.smallimages.split(",")[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount:     widget.entity.data.smallimages.split(",").length,
//        pagination: new SwiperPagination(
//            builder: DotSwiperPaginationBuilder(
//                color: Colors.white, activeColor: Colors.red)),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Container()),
              Container(
                alignment: Alignment.bottomLeft,
                width: double.infinity,
                height: AppConfig.logic_height(100),
                child: Container(
                  margin: EdgeInsets.only(left: AppConfig.logic_width(20)),
                  child: Text(
                    '${widget.entity.data.title}',
                    style: TextStyle(
                        fontSize: AppConfig.logic_fontSize(35),
                        color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget item(index) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),

          width: double.infinity,
          child: Text(
            widget.entity.data.setmeal[index].name,
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
