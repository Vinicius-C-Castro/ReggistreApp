import 'package:flutter/material.dart';

enum ImputTextType{
  email, password, text
}

typedef String InputValidate(String value);

class InputTextWidget extends StatefulWidget {
  final String label;
  final ImputTextType type;
  final InputValidate onValidate;

  const InputTextWidget({
    Key key,
    @required this.label,
    this.type = ImputTextType.text,
    @required this.onValidate,
  }) : super(key: key);

  static final _config = {
    ImputTextType.email: {
      "suffixIcon": Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.green
      ),
      "textStyle": TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF7F85A2)
      ),
      "obscureText": false,
      "border": OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2)),
      )
    },
    ImputTextType.password: {
      "suffixIcon": Icon(
          Icons.visibility,
      ),
      "textStyle": TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Color(0xFF7F85A2)
      ),
      "obscureText": true,
      "border": OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2)),
      )
    },
    ImputTextType.text: {
      "suffixIcon": null,
      "textStyle": TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF7F85A2)
      ),
      "obscureText": false,
      "border": OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2)),
      )
    },
  };

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  InputBorder get border => InputTextWidget._config[widget.type]['border'];

  TextStyle get textStyle => InputTextWidget._config[widget.type]['textStyle'];

  Widget get suffixIcon => InputTextWidget._config[widget.type]['suffixIcon'];

  bool get obscureText => InputTextWidget._config[widget.type]['obscureText'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(widget.label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
        ),
        Container(
          height: 48,
          child: TextField(
            onChanged: (value) {

            },
            obscureText: obscureText,
            style: textStyle,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                  border: border,
                enabledBorder: border,
                disabledBorder: border,
                errorBorder: border,
                focusedBorder: border,
                focusedErrorBorder: border
              )
          ),
        ),
      ],
    );
  }
}