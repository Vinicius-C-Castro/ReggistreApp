import 'package:ReggitreApp/pages/authentication/service/sign_up_model.dart';
import 'package:ReggitreApp/pages/authentication/widget/login_fresh_reset_password.dart';
import 'package:ReggitreApp/pages/authentication/widget/login_fresh_sign_up.dart';
import 'package:ReggitreApp/pages/authentication/widget/login_user_password.dart';
import 'package:ReggitreApp/pages/root_app.dart';
import 'package:flutter/material.dart';

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
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(user);
          print(password);
          print('--------------   end call   ----------------');
          isRequest(false);
        });
      },
      logo: 'assets/images/reggistre_logo.png',
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
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
            SignUpModel signUpModel) {
          isRequest(true);

          print(signUpModel.email);
          print(signUpModel.password);
          print(signUpModel.repeatPassword);
          print(signUpModel.surname);
          print(signUpModel.name);

          isRequest(false);
        });
  }
}
