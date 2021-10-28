import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multichoice/repository/auth_repository.dart';
import 'package:multichoice/utils/helper_functions.dart';

import 'base_model.dart';

enum AppStatus { uninitialized, authenticated, authenticating, unauthenticated }

class AuthenticationViewModel extends BaseViewModel {
  AppStatus _status = AppStatus.uninitialized;

  var user;

  AuthRepository authRepository = AuthRepository();

  AppStatus get status => _status;

  set status(AppStatus value) {
    _status = value;
  }

  setStatus(AppStatus status) {
    this.status = status;

    notifyListeners();
  }

  void init() async {
    setStatus(AppStatus.uninitialized);
    await Future.delayed(const Duration(seconds: 2));
    user = authRepository.getLocalUser();
    if (user == null) {
      setStatus(AppStatus.unauthenticated);
    } else {
      setStatus(AppStatus.authenticated);
    }
  }

  login(String email, String password) async {
    setBusy(true);
    try {
      user = await authRepository.login(email: email, password: password);
      setBusy(false);
      return true;
    } catch (e) {
      setBusy(false);
      HelperFunctions.toast(text: e.toString(),backgroundColor: Colors.red);
    }
  }

  signUp(String email, String password,String role,String userName) async {
    setBusy(true);
    try {
      await authRepository.signUp(email: email, password: password,role: role,userName: userName);
      setBusy(false);
      return true;
    } catch (e) {
      setBusy(false);
      HelperFunctions.toast(text: e.toString(),backgroundColor: Colors.red);
    }
  }

  logout() async {
    await authRepository.clearAllSavedData();
    setStatus(AppStatus.unauthenticated);
  }
}
