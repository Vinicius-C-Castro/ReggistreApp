import 'package:flutter/material.dart';

import 'utils/login_validators.dart';

class LoginController {
  final enabledButtonNotifer = ValueNotifier<bool>(true);
  bool get enabledButton => enabledButtonNotifer.value;
  set enabledButton(bool value) => enabledButtonNotifer.value = value;

  String _email;
  String _password;
  void onChangeAndValidate({String email, String password}) {
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    //
    // if (LoginValidators.email(_email) == "" &&
    //     LoginValidators.passsword(_password) == "") {
    //     enabledButton = false;
    // } else {
    //   enabledButton = true;
    // }
  }
}
