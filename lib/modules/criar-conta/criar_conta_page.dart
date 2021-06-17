import 'dart:ui';

import 'package:flutter/material.dart';

import 'criar_conta_controller.dart';
import 'utils/criar_conta_validators.dart';
import '../widgets/flat_button_expanded_widget.dart';
import '../widgets/input_text_widget.dart';

class CriarConta extends StatefulWidget {
  CriarConta({Key key}) : super(key: key);

  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarConta> {
  final controller = CriarContaController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: size.width,
                  height: size.height * 0.45,
                  child: Image.asset(
                    "assets/imagens/Reggistre_Logotipo.png",
                    fit: BoxFit.fitWidth,
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Criar conta",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      InputTextWidget(
                          label: "EMAIL",
                          type: InputTextType.email,
                          onChange: (email) =>
                              controller.onChangeAndValidate(email: email),
                          onValidate: CriarContaValidators.email),
                      SizedBox(
                        height: 18,
                      ),
                      InputTextWidget(
                          label: "SENHA",
                          type: InputTextType.password,
                          onChange: (password) => controller
                              .onChangeAndValidate(password: password),
                          onValidate: CriarContaValidators.passsword),
                      
                      SizedBox(
                        height: 18,
                      ),
                      ValueListenableBuilder(
                        valueListenable: controller.enabledButtonNotifer,
                        builder: (_, enabled, __) => enabled
                            ? FlatButtonExpandedWidget(
                          label: "Criar Conta",
                          onTap: () {},
                        )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
