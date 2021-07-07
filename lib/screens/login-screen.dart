import 'package:ReggitreApp/widgets/background-image.dart';
import 'package:ReggitreApp/widgets/password-input.dart';
import 'package:ReggitreApp/widgets/rounded-button.dart';
import 'package:ReggitreApp/widgets/text-field-input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pallete.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    "Reggistre",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                width: size.width,
                height: size.height * 0.60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 38,
                    ),
                    Text(
                      "Bem vindo",
                      style: kTExtLabel,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mantenha suas despesas em dia!",
                      style: kTExtLabelSub,
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Senha',
                      inputAction: TextInputAction.done,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                      child: Text(
                        'Esqueceu a senha',
                        style: kBodyText,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                      buttonName: 'Login',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                      child: Container(
                        child: Text(
                          'Criar nova conta',
                          style: kBodyText,
                        ),
                        decoration: BoxDecoration(
                            border:
                            Border(bottom: BorderSide(width: 1, color: kWhite))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
