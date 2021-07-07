import 'dart:ui';

import 'package:ReggitreApp/widgets/background-image.dart';
import 'package:ReggitreApp/widgets/password-input.dart';
import 'package:ReggitreApp/widgets/rounded-button.dart';
import 'package:ReggitreApp/widgets/text-field-input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pallete.dart';

class CreateNewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            children: [
              SizedBox(
                height: size.width * 0.2,
              ),
              Flexible(
                child: Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: CircleAvatar(
                        radius: size.width * 0.18,
                        backgroundColor: Colors.grey[400].withOpacity(
                          0.4,
                        ),
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: kWhite,
                          size: size.width * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'Usuário',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
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
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirmar senha',
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(buttonName: 'Criar conta', pushName: "/"),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já possui uma conta? ',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kGreen, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
