import 'package:flutter/material.dart';
import 'package:multichoice/utils/preference_utils.dart';

import 'app/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.getInstance();
  runApp(const RootApp());
}