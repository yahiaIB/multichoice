import 'package:multichoice/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	String? fullName;
	String? email;
	String? userName;
	String? dateCreated;
	String? token;
	List<String>? roles;
}
