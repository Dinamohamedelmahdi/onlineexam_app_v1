
import 'package:flutter/material.dart';
import 'package:onlineexam_app_v1/presentation/app_theme/app_theme_data.dart';
import 'package:onlineexam_app_v1/presentation/utilities/size_utilities.dart';

import '../common_widgets/custom_text_form_field.dart';
import '../utilities/text_utilities.dart';
import '../utilities/validation.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled=false;

void validateInputs(){
  setState((){
    isButtonEnabled=_formKey.currentState?.validate()??false;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text(TextUtilities.loginScreenName),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppThemeData.textPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(appSize.spacePadding),
        child: Form(
          key: _formKey,
          onChanged: validateInputs,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: emailController,
                label: TextUtilities.emailField,
                hintText: TextUtilities.emailFieldAsk,
                validator: validateEmail,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
              CustomTextFormField(
                controller: passwordController,
                label: TextUtilities.passwordField,
                hintText: TextUtilities.passwordFieldAsk,
                validator: validatePassword,
                obscureText: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(TextUtilities.rememberField),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(TextUtilities.forgetField,
                    style: TextStyle(
                      color: AppThemeData.textPrimaryColor,
                      decoration: TextDecoration.underline
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
              ElevatedButton(
                onPressed: isButtonEnabled? () {
                  }:null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                  backgroundColor:isButtonEnabled? (AppThemeData.primaryColor ): (AppThemeData.secondaryColor)
                ),
                child: Text(TextUtilities.loginButton,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:AppThemeData.textSecondaryColor,
                ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(TextUtilities.askIfHaveAccount,
                    style: TextStyle(
                        color:AppThemeData.textPrimaryColor
                    ),),
                  Text(
                    TextUtilities.signUpField,
                    style: TextStyle(
                        color:AppThemeData.primaryColor,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

