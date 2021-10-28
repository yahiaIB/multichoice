import 'package:flutter/material.dart';
import 'package:multichoice/repository/auth_repository.dart';
import 'package:multichoice/utils/helper_functions.dart';
import 'package:multichoice/viewmodels/base_model.dart';

class SignUpScreenViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? role;
  Color roleBorderColor = Colors.black45;
  final signUpFormKey = GlobalKey<FormState>();
  AuthRepository authRepository = AuthRepository();

  bool showPassword = true;
  List<String>? roles;
  bool gettingRoles = true;

  changeShowPassword(){
    showPassword = !showPassword;
    notifyListeners();
  }

  changeRole(value){
    role = value;
    notifyListeners();
  }

  getRoles() async {
    try{
      roles = await authRepository.getRoles();
      gettingRoles = false;
      notifyListeners();
    }catch(e){
      gettingRoles = false;
      notifyListeners();
      HelperFunctions.toast(text: e.toString(),backgroundColor: Colors.red);
    }
  }

  isFormValid(){
    if(role == null){
      roleBorderColor = Colors.red;
      signUpFormKey.currentState!.validate();
      notifyListeners();
      return false;
    }
    roleBorderColor = Colors.black45;
    return signUpFormKey.currentState!.validate();
  }

}