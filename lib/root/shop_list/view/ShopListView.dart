import '../../home/shopx_entity.dart';

abstract class ShopListView{
  void getShopsSuccess(ShopxEntity entity);
  void getShopsMoreSuccess(ShopxEntity entity);
}