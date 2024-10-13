import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineexam_app_v1/presentation/app_theme/app_theme_data.dart';
import 'package:onlineexam_app_v1/presentation/common_widgets/ErrorStateWidget.dart';
import 'package:onlineexam_app_v1/presentation/common_widgets/loading_widget.dart';
import 'package:onlineexam_app_v1/presentation/utilities/extract_error_message.dart';
import 'package:onlineexam_app_v1/presentation/utilities/size_utilities.dart';
import 'package:onlineexam_app_v1/presentation/view_models/login_view_model.dart';

import '../../di.dart';
import '../common_widgets/custom_text_form_field.dart';
import '../utilities/text_utilities.dart';
import '../utilities/validation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String routeName = "LoginScreen";

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

void validateInputs() {
  //  setState(() {});
      isButtonEnabled = _formKey.currentState?.validate() ?? false;
      print("is button Enabled : $isButtonEnabled");
  }

  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppThemeData.primaryBackgroundColor,
        appBar: AppBar(
          title: const Text(TextUtilities.loginScreenName),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: AppThemeData.textPrimaryColor,
        ),
        body: BlocListener<LoginViewModel, LoginHomeState>(
          listenWhen: (previous, current) {
          return current is LoginLoadingState || current is LoginErrorState;
          },
          listener: (context, state) {
            if (state is LoginLoadingState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return LoadingStateWidget();
                  });
            } else if (state is LoginErrorState) {
              Navigator.pop(context);
              var message = extractErrorMessage(state.exception);
              showDialog(
                  context: context,
                  builder: (context) {
                    return ErrorStateWidget(message);
                  });
            }
            if (state is LoginSuccessState) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Logged in Successfully"),
                    );
                  });
            }
          },
          child: Padding(
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
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          appSize.spaceHeightRatio),
                  CustomTextFormField(
                    controller: passwordController,
                    label: TextUtilities.passwordField,
                    hintText: TextUtilities.passwordFieldAsk,
                    validator: validatePassword,
                    obscureText: true,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          appSize.spaceHeightRatio),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text(TextUtilities.rememberField),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          TextUtilities.forgetField,
                          style: TextStyle(
                              color: AppThemeData.textPrimaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          appSize.spaceHeightRatio),
                  BlocBuilder<LoginViewModel, LoginHomeState>(
                    buildWhen: (previous,current){
                      return current is LoginSuccessState || current is LoginErrorState || current is LoginLoadingState;
                    },
                    builder: (context, state) {
                      switch (state) {
                        case LoginInitialState():
                        case LoginLoadingState():
                          return LoadingStateWidget();
                        case LoginSuccessState():
                         return Text("welcome.....");
                        case LoginErrorState():
                         { return ErrorStateWidget(state.exception.toString());}
                        default:  return ElevatedButton(
                          onPressed: () {
                            {
                              if (isButtonEnabled == true) {
                                viewModel.login("nabil@elevate.com", "12345");
                               // viewModel.login(emailController.text,passwordController.text);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              disabledBackgroundColor:
                              (AppThemeData.secondaryColor),
                              minimumSize: Size(
                                  double.infinity,
                                  MediaQuery.of(context).size.height *
                                      appSize.bottomWidthRatio),
                              backgroundColor: isButtonEnabled
                                  ? (AppThemeData.primaryColor)
                                  : (AppThemeData.secondaryColor)),
                          child: Text(
                            TextUtilities.loginButton,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppThemeData.textSecondaryColor,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          appSize.spaceHeightRatio),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TextUtilities.askIfHaveAccount,
                        style: TextStyle(color: AppThemeData.textPrimaryColor),
                      ),
                      Text(
                        TextUtilities.signUpField,
                        style: TextStyle(
                            color: AppThemeData.primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
