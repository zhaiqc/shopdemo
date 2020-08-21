import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class ShopEntity with JsonConvert<ShopEntity> {
	int code;
	String msg;
	String time;
	List<ShopData> data;
}

class ShopData with JsonConvert<ShopData> {
	int id;
	String title;
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
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "spell_status_text")
	String spellStatusText;
}
