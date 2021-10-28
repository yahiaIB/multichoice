import 'package:flutter/material.dart';
import 'package:multichoice/viewmodels/base_model.dart';

class LoginScreenViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  bool showPassword = true;

  changeShowPassword(){
    showPassword = !showPassword;
    notifyListeners();
  }

  isFormValid(){
    return loginFormKey.currentState!.validate();
  }

}