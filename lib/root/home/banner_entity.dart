import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	int code;
	String msg;
	String time;
	List<BannerData> data;
}

class BannerData with JsonConvert<BannerData> {
	int id;
	String title;
	@JSONField(name: "jump_address")
	String jumpAddress;
	@JSONField(name: "img_url")
	String imgUrl;
	int createtime;
	int updatetime;
	String status;
	@JSONField(name: "status_text")
	String statusText;
}
