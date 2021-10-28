import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multichoice/models/user_entity.dart';
import 'package:multichoice/utils/helper_functions.dart';
import 'package:multichoice/utils/preference_utils.dart';
import 'package:multichoice/web_service/end_points.dart';
import 'package:multichoice/web_service/http_client.dart';

class AuthRepository {

  late final HttpClient _httpClientService;
  late final PreferenceUtils _preferenceUtils;

  AuthRepository() {
    _httpClientService = HttpClient();
    _preferenceUtils = PreferenceUtils.getInstance();

  }

  isSignedIn() async {
    return false;
  }

  saveUserLocal(userData){
    _preferenceUtils.saveStringData(PreferenceUtils.userToken, userData["token"]);
    _preferenceUtils.saveStringData(PreferenceUtils.userKey, jsonEncode(userData));
  }

  getLocalUser(){
    var userData = _preferenceUtils.getData(PreferenceUtils.userKey);
    if(userData != null){
      return UserEntity().fromJson(jsonDecode(userData));
    }
    return null;
  }

  clearAllSavedData() async {
    return await _preferenceUtils.clearAll();
  }

  Future<UserEntity> login({@required email, @required password}) async {
    try {
      var data = {"email": email, "password": password};
      final response =
          await _httpClientService.getInstance().post(EndPoints.login, data: data);
      HelperFunctions.isValidResponse(response);
      saveUserLocal(response.data["dateSet"]);
      return  UserEntity().fromJson(response.data["dateSet"]);
    } catch (e) {
      rethrow;
    }
  }

  getRoles() async {
    try {
      final response =
          await _httpClientService.getInstance().get(EndPoints.getRoles);
      HelperFunctions.isValidResponse(response);
      return List<String>.from(response.data["dateSet"]);
    } catch (e) {
      rethrow;
    }
  }

  signUp({@required email, @required password,@required userName,@required role,}) async {
    try {
      Map<String,dynamic> data = {"email": email, "password": password,"fullName": userName,"roles": <String>[role] };
      final response =
      await _httpClientService.getInstance().post(EndPoints.signUp, data: data);
      HelperFunctions.isValidResponse(response);
      return response.data["dateSet"];
    } catch (e) {
      rethrow;
    }
  }


}
