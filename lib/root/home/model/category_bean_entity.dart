import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class CategoryBeanEntity with JsonConvert<CategoryBeanEntity> {
	int code;
	String msg;
	String time;
	List<CategoryBeanData> data;
}

class CategoryBeanData with JsonConvert<CategoryBeanData> {
	int id;
	int pid;
	String type;
	String name;
	String image;
	String flag;
	@JSONField(name: "type_text")
	String typeText;
	@JSONField(name: "flag_text")
	String flagText;
}
