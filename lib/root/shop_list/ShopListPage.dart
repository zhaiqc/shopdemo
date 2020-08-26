import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:shop/root/home/model/shop_detail_entity.dart';
import 'package:shop/root/home/shopx_entity.dart';
import 'package:shop/root/shop_list/view/ShopListView.dart';
import 'package:shop/root/shop_list/view_model/ShopListViewModel.dart';
import 'package:shop/utils/AppConfig.dart';
import '../../utils/AlertView.dart';
import '../../utils/AppConfig.dart';
import '../detail/DetailPage.dart';

class ShopListPage extends StatefulWidget {
  int category_id;

  ShopListPage(this.category_id);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> implements ShopListView {
//  HomeViewModel _viewModel;
  EasyRefreshController _controller = EasyRefreshController();

  ShopListViewModel _viewModel;
  ShopxEntity _entity;
  int page =1;
  int limit =12;
@override
  void initState() {
  _viewModel =new ShopListViewModel(this);
  _viewModel.getShops(page: page,limit: limit,category_id: widget.category_id);
  // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: build_appbar(),
    body:_entity!=null?   EasyRefresh(
      header: BallPulseHeader(        color: Colors.red
      ),
      footer: BallPulseFooter(
        color: Colors.red
      ),
      child: CustomScrollView(slivers: [
        SliverList(

            delegate:SliverChildBuilderDelegate((BuildContext context, int index){
          return shopItem(_entity.data[index]);
        },childCount: _entity.data.length))
      ],),
      onRefresh: () async{
        page=1;
        _viewModel.getShops(page: page,limit: limit,category_id: widget.category_id);


      },
      onLoad: () async {
        page =page +1;
        _viewModel.getShops(page: page,limit: limit,category_id: widget.category_id);

      },
    ):AppConfig.loadingView(),

      );
  }


  Widget build_appbar(){
    return new AppBar(
      backgroundColor: Colors.red,
      leading: new IconButton(

          icon: const Icon(Icons.chevron_left,),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: (){Navigator.pop(context);}
      ),
      centerTitle: true,
      title: new Text("商品列表",maxLines: 1,overflow: TextOverflow.ellipsis,),

    );
  }
  Widget shopItem(ShopxData data) {
    return Container(
      height: AppConfig.logic_height(300),
        child: InkWell(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 10),

//              color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: AppConfig.logic_width(50),
                          decoration: new BoxDecoration(
                            //背景
                            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                            borderRadius: BorderRadius.all(
                                Radius.circular(25.0)),
                            //设置四周边框
//                              border: new Border.all(width: 1, color: Colors.red),
                          ),
                          child: Image.network(

                            data.smallimages.split(",")[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            textDirection: TextDirection.ltr,
                            children: [

                              Expanded(
                                  child: Container(
                                    child: Text(
                                      data.title,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          fontSize: AppConfig.logic_width(30)),
                                    ),
                                    width: double.infinity,
                                  )),
                              Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      data.priceTitle,
                                      style: TextStyle(
                                          fontSize: AppConfig.logic_width(30)),
                                    ),
                                  )),
                              Expanded(
                                  child: Container(
                                      height: AppConfig.logic_width(50),
                                      child:ListView.builder(
                                          itemCount:data.manystoretapsText.length ,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (contex,index){
                                            return Container(

                                              alignment: Alignment.center,
                                              child: Text("${data.manystoretapsText[index].name}",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize:
                                                    AppConfig.logic_fontSize(18)),
                                              ),
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                border: new Border.all(
                                                    width: AppConfig.logic_width(2),
                                                    color: Colors.red),
                                              ),
                                              margin: EdgeInsets.all(
                                                  AppConfig.logic_width(10)),
                                              height: AppConfig.logic_width(40),
                                              width: AppConfig.logic_width(100),
                                            );
                                          })
                                  )),
                              Expanded(
                                  child: Container(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Text(
                                            "￥${data.price}",
                                            style: TextStyle(
                                                fontSize: AppConfig.logic_width(30),
                                                color: Colors.red),
                                          ),
                                          Text(
                                            "￥${data.originalPrice}",
                                            style: TextStyle(
                                                fontSize: AppConfig.logic_width(25),
                                                color: Colors.grey,
                                                decoration:
                                                TextDecoration.lineThrough),
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "马上抢",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                  AppConfig.logic_fontSize(20)),
                                            ),
                                            decoration: new BoxDecoration(
                                              //背景
                                              color: Colors.red,
                                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0)),
                                              //设置四周边框
//                              border: new Border.all(width: 1, color: Colors.red),
                                            ),
                                            height: AppConfig.logic_height(50),
                                            margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            width: AppConfig.logic_width(90),
                                          )
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                        flex: 2,
                      )
                    ],
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                child: Card(
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
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
                          ],
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Text("${data.recommend}位体验师推荐"),
                        flex: 4,
                      ),
                      Expanded(
                        child: Text(
                          "已有${data.shoplike}人种草",
                          style: TextStyle(color: Colors.grey),
                        ),
                        flex: 4,
                      )
                    ],
                  ),
                ),
                flex: 2,
              ),
            ],
          ),
          onTap: () {
            _viewModel.getShop(shoplist_id: data.id).then((value) =>show(value));

//          showDialog(
//            context: context,
//            barrierDismissible: true,
//            builder: (BuildContext context)=>new AlertView(),
//          );
          },
        ));
  }
  void show(ShopDetailEntity entity){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => new AlertView(
        entity: entity,
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (_) => new DetailPage(entity)));
        },
      ),
    );
  }

  @override
  void getShopsSuccess(ShopxEntity entity) {
  setState(() {
    _entity=entity;
  });
    // TODO: implement getShopsSuccess
  }

  @override
  void getShopsMoreSuccess(ShopxEntity entity) {
  setState(() {
    entity.data.forEach((element) {
    _entity.data.add(element);
    });

  });
    // TODO: implement getShopsMoreSuccess
  }
}
