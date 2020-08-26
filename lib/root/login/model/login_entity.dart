import 'package:shop/generated/json/base/json_convert_content.dart';
import 'package:shop/generated/json/base/json_filed.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	int code;
	String msg;
	String time;
	LoginData data;
}

class LoginData with JsonConvert<LoginData> {
	LoginDataUserinfo userinfo;
}

class LoginDataUserinfo with JsonConvert<LoginDataUserinfo> {
	int id;
	String username;
	String nickname;
	String mobile;
	String avatar;
	int score;
	String token;
	@JSONField(name: "user_id")
	int userId;
	int createtime;
	int expiretime;
	@JSONField(name: "expires_in")
	int expiresIn;
}
