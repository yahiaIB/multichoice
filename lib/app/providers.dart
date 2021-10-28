import 'package:multichoice/viewmodels/authentication.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthenticationViewModel()..init())
];
