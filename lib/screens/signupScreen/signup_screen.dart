import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multichoice/screens/signupScreen/signup_screen_view_model.dart';
import 'package:multichoice/styles/custom_assets.dart';
import 'package:multichoice/styles/custom_colors.dart';
import 'package:multichoice/utils/validators.dart';
import 'package:multichoice/viewmodels/authentication.dart';
import 'package:multichoice/widgets/button.dart';
import 'package:multichoice/widgets/text_form_field_custom.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoWidth = MediaQuery.of(context).size.width * .2;

    signUp(SignUpScreenViewModel _model) async {
      if (_model.isFormValid()) {
        var response = await context.read<AuthenticationViewModel>().signUp(
            _model.emailController.text.trim(),
            _model.passwordController.text.trim(),
            _model.role!,
            _model.userNameController.text.trim());
        if(response) Navigator.pop(context);
      }
    }

    return ChangeNotifierProvider(
      create: (_) => SignUpScreenViewModel()..getRoles(),
      child: Consumer<SignUpScreenViewModel>(
          builder: (context, signUpViewModel, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
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
                      key: signUpViewModel.signUpFormKey,
                      child: Column(
                        children: [
                          ///Username
                          TextFormFieldCustom(
                            controller: signUpViewModel.userNameController,
                            labelText: "الأسم",
                            validation: (v) => Validators.validString(v!),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),

                          ///email
                          TextFormFieldCustom(
                            controller: signUpViewModel.emailController,
                            labelText: "البريد الألكتروني",
                            validation: (v) => Validators.validEmail(v!),
                          ),
                          const SizedBox(
                            height: 18.0,
                          ),

                          ///Role
                          signUpViewModel.gettingRoles
                              ? const CircularProgressIndicator()
                              : signUpViewModel.roles == null
                                  ? const Text("فشل في تحميل الأدوار")
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                signUpViewModel.roleBorderColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      child: DropdownButton<String>(
                                        value: signUpViewModel.role,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        iconSize: 24,
                                        isExpanded: true,
                                        hint: const Text('وظيفة'),
                                        style: const TextStyle(
                                            color: Colors.black),
                                        underline: Container(),
                                        onChanged: (newValue) => signUpViewModel
                                            .changeRole(newValue!),
                                        items: signUpViewModel.roles!
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                          const SizedBox(
                            height: 18.0,
                          ),

                          ///Password
                          TextFormFieldCustom(
                            controller: signUpViewModel.passwordController,
                            labelText: "كلمة المرور",
                            validation: (v) => Validators.validPassword(v!),
                            suffixIcon: GestureDetector(
                              onTap: signUpViewModel.changeShowPassword,
                              child: Icon(
                                signUpViewModel.showPassword
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
                              ? Button("تسجيل", () => signUp(signUpViewModel))
                              : const CircularProgressIndicator(
                                  color: CustomColors.buttonColor,
                                ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          !context.watch<AuthenticationViewModel>().busy
                              ? Button("الرجوع لتسجيل الدخول", () {
                                  Navigator.pop(context);
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
