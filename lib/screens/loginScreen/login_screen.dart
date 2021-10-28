import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multichoice/app/routes.dart';
import 'package:multichoice/screens/loginScreen/login_screen_view_model.dart';
import 'package:multichoice/styles/custom_assets.dart';
import 'package:multichoice/styles/custom_colors.dart';
import 'package:multichoice/utils/validators.dart';
import 'package:multichoice/viewmodels/authentication.dart';
import 'package:multichoice/widgets/button.dart';
import 'package:multichoice/widgets/text_form_field_custom.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoWidth = MediaQuery.of(context).size.width * .2;

    login(LoginScreenViewModel _model) async {
      if (_model.isFormValid()) {
        var response = await context.read<AuthenticationViewModel>().login(
            _model.emailController.text.trim(),
            _model.passwordController.text.trim());
        if(response){
          context.read<AuthenticationViewModel>().setStatus(AppStatus.authenticated);
        }
      }
    }

    return ChangeNotifierProvider(
      create: (_) => LoginScreenViewModel(),
      child:
          Consumer<LoginScreenViewModel>(builder: (context, loginViewModel, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .15),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(CustomAssets.background),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                    ),
                    Center(
                        child: Image.asset(
                      CustomAssets.logo,
                      width: logoWidth,
                      height: logoWidth,
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .12,
                    ),
                    Form(
                      key: loginViewModel.loginFormKey,
                      child: Column(
                        children: [
                          ///email
                          TextFormFieldCustom(
                            controller: loginViewModel.emailController,
                            labelText: "البريد الألكتروني",
                            validation: (v) => Validators.validEmail(v!),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),

                          ///Password
                          TextFormFieldCustom(
                            controller: loginViewModel.passwordController,
                            labelText: "كلمة المرور",
                            validation: (v) => Validators.validPassword(v!),
                            suffixIcon: GestureDetector(
                              onTap: loginViewModel.changeShowPassword,
                              child: Icon(
                                loginViewModel.showPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          !context.watch<AuthenticationViewModel>().busy
                              ? Button("دخول", () => login(loginViewModel))
                              : const CircularProgressIndicator(
                                  color: CustomColors.buttonColor,
                                ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          !context.watch<AuthenticationViewModel>().busy
                              ? Button("تسجيل حساب جديد", () {
                                  Navigator.pushNamed(context, Routes.signUp);
                                })
                              : Container(),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      }),
    );
  }
}
