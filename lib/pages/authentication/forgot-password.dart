import 'package:ReggitreApp/widget/rounded-button.dart';
import 'package:ReggitreApp/widget/text-field-input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pallete.dart';


class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: reggistreCollorGreen,
          body: Column(
            children: [
              // Flexible(
                // child: Center(
                //   child: Text(
                //     "Reggistre",
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 60,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
              // ),
              Container(
                width: size.width,
                height: size.height * 1.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Esqueceu a senha",
                            style: kTExtLabel,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width * 0.8,
                            child: Text(
                              'Entre com seu email e enviaremos intruções de como alterar sua senha',
                              style: kTExtLabelSub,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextInputField(
                            icon: FontAwesomeIcons.envelope,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedButton(buttonName: 'Enviar'),
                        ],
                      ),
                    )
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
