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
          Container(
            width: size.width,
            height: size.height,
            color: Colors.green,
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
                        Text("Bem vindo!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Mantenha suas despesas em dia!"),
                        SizedBox(
                          height: 40 ,
                        ),
                        InputTextWidget(label: "EMAIL"),
                        SizedBox(
                          height: 16 ,
                        ),
                        InputTextWidget(label: "SENHA"),
                        SizedBox(
                          height: 16 ,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: null,
                                child: Text(
                                  "ENTER",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.green,
                                onLongPress: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16 ,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: null,
                                child: Text(
                                  "Esqueci minha senha",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onLongPress: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16 ,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: null,
                                child: Text(
                                  "CRIAR UMA CONTA",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onLongPress: () {},
                              ),
                            ),
                          ],
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