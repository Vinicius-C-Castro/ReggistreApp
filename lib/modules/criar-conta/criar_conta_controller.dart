import 'package:flutter/material.dart';

import 'utils/criar_conta_validators.dart';

class CriarContaController {
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

    // if (CriarContaValidators.email(_email) == null &&
    //     CriarContaValidators.passsword(_password) == null) {
    //   enabledButton = true;
    // } else {
    //   enabledButton = false;
    // }
  }
}