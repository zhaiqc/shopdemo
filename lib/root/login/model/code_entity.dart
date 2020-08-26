import 'package:shop/generated/json/base/json_convert_content.dart';

class CodeEntity with JsonConvert<CodeEntity> {
	int code;
	String msg;
	String time;
	dynamic data;
}
