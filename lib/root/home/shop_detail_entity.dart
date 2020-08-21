import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class ShopDetailEntity with JsonConvert<ShopDetailEntity> {
	int code;
	String msg;
	String time;
	ShopDetailData data;
}

class ShopDetailData with JsonConvert<ShopDetailData> {
	int id;
	String title;
	String subtitle;
	@JSONField(name: "category_id")
	int categoryId;
	String price;
	@JSONField(name: "original_price")
	String originalPrice;
	@JSONField(name: "price_title")
	String priceTitle;
	String smallimages;
	int shoplike;
	int recommend;
	String status;
	@JSONField(name: "spell_status")
	String spellStatus;
	@JSONField(name: "spell_num")
	int spellNum;
	int createtime;
	int updatetime;
	@JSONField(name: "manystore_id")
	int manystoreId;
	@JSONField(name: "setmeal_ids")
	String setmealIds;
	@JSONField(name: "manystoretaps_ids")
	String manystoretapsIds;
	String attachfile;
	String content;
	String rightsandinterestscontent;
	List<ShopDetailDataSetmeal> setmeal;
	List<ShopDetailDataManystoretap> manystoretaps;
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "spell_status_text")
	String spellStatusText;
}

class ShopDetailDataSetmeal with JsonConvert<ShopDetailDataSetmeal> {
	int id;
	String name;
	String price;
	@JSONField(name: "status_text")
	String statusText;
}

class ShopDetailDataManystoretap with JsonConvert<ShopDetailDataManystoretap> {
	int id;
	String name;
}
