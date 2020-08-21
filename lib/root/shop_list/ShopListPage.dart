import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/root/home/HomeViewModel.dart';
import 'package:shop/root/home/shopx_entity.dart';
import 'package:shop/utils/AppConfig.dart';
import 'package:shop/utils/provider/ViewModelProvider.dart';

class ShopListPage extends StatefulWidget {
  int category_id;

  ShopListPage(this.category_id);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
//  HomeViewModel _viewModel;
  int page =1;
  int limit =12;
@override
  void initState() {
//  _viewModel = ViewModelProvider.of(context);
//  _viewModel.init(context);
  // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: build_appbar()
      body: StreamBuilder<ShopxEntity>(builder: null,stream: ,)
      ,);
  }

  Widget build_appbar(){
    return new AppBar(
      leading: new IconButton(
          icon: const Icon(Icons.chevron_left,),
          color: Colors.red,
          iconSize: 30.0,
          onPressed: (){Navigator.pop(context);}
      ),
      centerTitle: true,
      title: new Text("商品列表",maxLines: 1,overflow: TextOverflow.ellipsis,),

    );
  }
}
