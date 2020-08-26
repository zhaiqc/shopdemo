import 'package:dio/dio.dart';
import 'package:shop/root/home/model/shop_detail_entity.dart';
import 'package:shop/root/home/shopx_entity.dart';
import 'package:shop/root/shop_list/view/ShopListView.dart';
import 'package:shop/utils/HttpUtils.dart';


class ShopListViewModel{
  ShopListView _view;

  ShopListViewModel(this._view);

  void getShops({int page, int limit,int category_id})async{
    var data ={"category_id":category_id,"page":page,"limit":limit,"status":2};
    Response  res=await  HttpUtils().sendData(url: "index/index",data: data);
    print("_ShopListPageState ${res}");
    ShopxEntity entity = ShopxEntity().fromJson(res.data);

    if(page==1){
      _view.getShopsSuccess(entity);

    }else{
      _view.getShopsSuccess(entity);

    }
  }

  Future<ShopDetailEntity> getShop({int shoplist_id})async{
    print("shoplist_id ${shoplist_id}");
    FormData formData = new FormData.fromMap({"shoplist_id": shoplist_id});
    Response  res=await  HttpUtils().sendData(url: "index/getShop",data: formData);
    print("getShop ${res}");
    ShopDetailEntity entity = ShopDetailEntity().fromJson(res.data);
    return Future(()=>entity);

  }
}