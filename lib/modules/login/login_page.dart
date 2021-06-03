import 'widgets/flat_button_expanded.dart';
import 'widgets/input_text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Image.asset("assets/imagens/Reggistre_Logotipo.png", fit: BoxFit.fitWidth,),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child:  Container(
                width: size.width,
                height: size.height * 0.65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Bem vindo!",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mantenha suas despesas em dia!",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8F92A1)
                          ),
                        ),
                        SizedBox(
                          height: 38 ,
                        ),
                        InputTextWidget(
                          label: "EMAIL",
                          type: ImputTextType.email
                        ),
                        SizedBox(
                          height: 18 ,
                        ),
                        InputTextWidget(
                          label: "SENHA",
                          type: ImputTextType.password,
                        ),
                        SizedBox(
                          height: 18 ,
                        ),
                        FlatButtonExpanded(
                          label: "ENTRAR",
                          onTap: (){},
                          type: FlatButtonExpandedType.fill,
                        ),
                        SizedBox(
                          height: 18 ,
                        ),
                        FlatButtonExpanded(
                          label: "Esqueci minha senha",
                          onTap: (){},
                          type: FlatButtonExpandedType.none,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        FlatButtonExpanded(
                          label: "Criar uma conta",
                          onTap: (){},
                          type: FlatButtonExpandedType.outline,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          )
        ],
      )
    );
  }
}