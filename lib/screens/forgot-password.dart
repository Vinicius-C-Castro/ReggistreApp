import 'package:ReggitreApp/widgets/rounded-button.dart';
import 'package:ReggitreApp/widgets/text-field-input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pallete.dart';


class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.green,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: Text(
              'Esqueceu a senha',
              style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700 ),
            ),
            centerTitle: true,
          ),
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
                height: size.height * 0.55,
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
                            height: size.height * 0.1,
                          ),
                          Container(
                            width: size.width * 0.8,
                            child: Text(
                              'Entre com seu email e enviaremos intruções de como alterar sua senha',
                              style: kBodyText,
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
                          RoundedButton(buttonName: 'Enviar')
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
