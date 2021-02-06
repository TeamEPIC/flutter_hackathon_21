import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/components/button/register_button.dart';
import 'package:flutter_hackathon_21/core/components/inputs/auth_textformfield.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/constants/page_consts/page_const.dart';
import 'package:flutter_hackathon_21/core/extensions/context_extensions.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  //final ValueSetter<UserHiveObject> onSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.height / 50),
          child: Column(
            children: [
              loginLogo(context),
              emailTextField(),
              passwordTextField(),
              buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar get buildAppBar => AppBar(title: const Text(PageConstants.LOGIN_PAGE));

  FlutterLogo loginLogo(BuildContext context) =>
      FlutterLogo(size: context.height / 7);

  AuthTextFormField emailTextField() {
    return AuthTextFormField(
      controller: _textEditingController,
      labelText: AppConstants.EMAIL_TEXT,
      hintText: AppConstants.EMAIL_HINT_TEXT,
      onSaved: null,
      validator: null,
    );
  }

  AuthTextFormField passwordTextField() {
    return AuthTextFormField(
      controller: _textEditingController,
      labelText: AppConstants.PASSWORD_TEXT,
      hintText: AppConstants.PASSWORD_HINT_TEXT,
      onSaved: null,
      validator: null,
    );
  }

  RegisterButton buildRegisterButton() => RegisterButton(
        text: AppConstants.LOGIN_BUTTON_TEXT,
        //onPressed: onSet?.call,
      );
}
