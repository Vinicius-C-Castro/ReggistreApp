import 'package:ReggitreApp/pages/authentication/service/sign_up_model.dart';
import 'package:ReggitreApp/pages/authentication/widget/login_fresh_reset_password.dart';
import 'package:ReggitreApp/pages/authentication/widget/login_fresh_sign_up.dart';
import 'package:ReggitreApp/pages/authentication/widget/login_user_password.dart';
import 'package:ReggitreApp/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'globals.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //You have to create a list with the type of login's that you are going to import into your application

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reggistre',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(body: widgetLoginFreshUserAndPassword()));
  }

  Widget widgetLoginFreshUserAndPassword() {
    return LoginFreshUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String userName,
          String password) async {

        bool sucesso = false;
        isRequest(true);
        http.Response res = await http.get(BASE_URL+'/api/v1/user/read-all');

        if (res.statusCode == 200) {
          var responseData = json.decode(res.body);
          PessoaFisica pessoaFisica;

          for (var singleUser in responseData) {
            PessoaFisica user = PessoaFisica(
                id: singleUser["id"],
                nomeCompleto: singleUser["nomeCompleto"],
                situacao: singleUser["situacao"],
                data: singleUser["data"],
                email: singleUser["email"],
                saldo: singleUser["saldo"],
                nomeUsuario: singleUser["nomeUsuario"],
                senha: singleUser["senha"],
                quantidadePontos: singleUser["quantidadePontos"],
                data_nascimento: singleUser["data_nascimento"],
                tipoConta: singleUser["tipoConta"],
                premioPessoa: singleUser["premioPessoa"],

            );

            if (user.nomeUsuario == userName) {
              globalPessoaFisica = user;
              if (user.senha == password) {
                sucesso = true;
                break;
              } else {
                showErrorLogin(_context, "Senha incorreta.");
                break;
              }
            }
          }

          if (globalPessoaFisica == null) {
            showErrorLogin(_context, "Usuário não encontrado.");
          }

          isRequest(false);
        } else {
          showErrorLogin(_context, "Sem resposta do servidor.");
        }

        return sucesso;
      },
      logo: 'assets/images/reggistre_logo.png',
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
    );
  }

  void showSucessCreate(BuildContext context, String mensagem) {
    showDialog(
        context: context,
        barrierDismissible: false, // disables popup to close if tapped outside popup (need a button to close)
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius:
            BorderRadius.all(Radius.circular(15))),
            title: Text("Sucesso",),
            content: Text(mensagem),
            //buttons?
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () { Navigator.of(context).pop(); }, //closes popup
              ),
            ],
          );
        }
    );
  }

  void showErrorLogin(BuildContext context, String mensagemErro) {
    showDialog(
        context: context,
        barrierDismissible: false, // disables popup to close if tapped outside popup (need a button to close)
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius:
            BorderRadius.all(Radius.circular(15))),
            title: Text("Erro",),
            content: Text(mensagemErro),
            //buttons?
            actions: <Widget>[
              FlatButton(
                child: Text("Fechar"),
                onPressed: () { Navigator.of(context).pop(); }, //closes popup
              ),
            ],
          );
        }
    );
  }
  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/images/reggistre_logo.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(email);
          print('--------------   end call   ----------------');
          isRequest(false);
        });
      },
    );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
        logo: 'assets/images/reggistre_logo.png',
        funSignUp: (BuildContext _context, Function isRequest,
            SignUpModel signUpModel) async {
          isRequest(true);
          bool sucesso = false;
          String url = BASE_URL+'/api/v1/user/create';

          Map data = {
            "nomeCompleto": signUpModel.name,
            "situacao": true,
            "data": "2021-04-09T20:00:00.000+00:00",
            "email": signUpModel.email,
            "saldo": 0,
            "nomeUsuario": signUpModel.surname,
            "senha": signUpModel.password,
            "quantidadePontos": 0,
            "data_nascimento": "2021-04-09T20:00:00.000+00:00",
            "idtipoConta": 1
          };

          var body = json.encode(data);

          var response = await http.post(url,
              headers: {"Content-Type": "application/json"},
              body: body
          );

          if (response.statusCode == 200) {
            sucesso = true;
            showSucessCreate(_context, "Usuário criado com sucesso.");
          } else {
            showErrorLogin(_context ,"Falha ao criar usuário.");
          }

          isRequest(false);

          return sucesso;
        });
  }
}
