import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class BannerBeanEntity with JsonConvert<BannerBeanEntity> {
	int code;
	String msg;
	String time;
	List<BannerBeanData> data;
}

class BannerBeanData with JsonConvert<BannerBeanData> {
	int id;
	String title;
	@JSONField(name: "jump_address")
	String jumpAddress;
	String image;
	int createtime;
	int updatetime;
	String status;
	@JSONField(name: "status_text")
	String statusText;
}
