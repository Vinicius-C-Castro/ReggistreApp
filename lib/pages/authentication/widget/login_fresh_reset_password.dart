import 'package:ReggitreApp/theme/colors.dart';
import 'package:flutter/material.dart';

import './login_fresh_loading.dart';
import '../config/language.dart';

class LoginFreshResetPassword extends StatefulWidget {
  final Color backgroundColor;

  final Color textColor;

  final LoginFreshWords loginFreshWords;

  final String logo;

  final Function funResetPassword;

  final isFooter;

  final Widget widgetFooter;

  LoginFreshResetPassword(
      {@required this.funResetPassword,
      this.isFooter,
      this.widgetFooter,
      this.backgroundColor,
      this.textColor,
      this.loginFreshWords,
      @required this.logo});

  @override
  _LoginFreshResetPasswordState createState() =>
      _LoginFreshResetPasswordState();
}

class _LoginFreshResetPasswordState extends State<LoginFreshResetPassword> {
  TextEditingController _textEditingControllerUser = TextEditingController();

  bool isRequest = false;

  final focus = FocusNode();
  LoginFreshWords loginFreshWords;

  @override
  Widget build(BuildContext context) {
    loginFreshWords = (widget.loginFreshWords == null)
        ? LoginFreshWords()
        : widget.loginFreshWords;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: widget.backgroundColor ?? blue,
          centerTitle: true,
          elevation: 0,
          title: Text(
            this.loginFreshWords.recoverPassword,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              color: widget.backgroundColor ?? blue,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 3),
                        child: Hero(
                          tag: 'hero-login',
                          child: Image.asset(
                            widget.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(50.0),
                    topRight: const Radius.circular(50.0),
                  )),
              child: buildBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                loginFreshWords.messageRecoverPassword,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: widget.textColor ?? grey, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                  controller: this._textEditingControllerUser,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: widget.textColor ?? grey,
                      fontSize: 14),
                  autofocus: false,
                  onSubmitted: (v) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icons/icon_user.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Color(0xFFAAB5C3))),
                      filled: true,
                      fillColor: Color(0xFFF3F3F5),
                      focusColor: Color(0xFFF3F3F5),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Color(0xFFAAB5C3))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color:
                                  widget.backgroundColor ?? green)),
                      hintText: this.loginFreshWords.hintRecoverEmail)),
            ),
            (this.isRequest)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoadingLoginFresh(
                      textLoading: this.loginFreshWords.textLoading,
                      colorText: widget.textColor,
                      backgroundColor: widget.backgroundColor,
                      elevation: 0,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      widget.funResetPassword(context, this.setIsRequest,
                          this._textEditingControllerUser.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color:
                                  widget.backgroundColor ?? green,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                    child: Text(
                                  this.loginFreshWords.recoverPassword,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ))),
                    ),
                  ),
          ],
        ),
        SizedBox(),
        (widget.isFooter == null || widget.isFooter == false)
            ? SizedBox()
            : widget.widgetFooter
      ],
    );
  }

  void setIsRequest(bool isRequest) {
    setState(() {
      this.isRequest = isRequest;
    });
  }
}
