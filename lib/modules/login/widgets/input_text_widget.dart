import 'package:flutter/material.dart';

enum ImputTextType{
  email, password, text
}

class InputTextWidget extends StatelessWidget {
  final String label;
  final ImputTextType type;

  const InputTextWidget({
    Key key,
    @required this.label,
    this.type = ImputTextType.text,
  }) : super(key: key);

  InputBorder get inputBorder =>  OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
          color: Color.fromRGBO(143, 146, 161, 0.2),
          width: 2
      )
  );


  static const _config = {
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
    },
    ImputTextType.password: {
      "suffixIcon": Icon(
          Icons.visibility,
      ),
      "textStyle": TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF7F85A2)
      ),
      "obscureText": true,
    },
    ImputTextType.text: {
      "suffixIcon": null,
      "textStyle": TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF7F85A2)
      ),
      "obscureText": false,
    },
  };

  TextStyle get textStyle => _config[type]['textStyle'];
  Widget get suffixIcon => _config[type]['suffixIcon'];
  bool get obscureText => _config[type]['obscureText'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
        ),
        Container(
          height: 48,
          child: TextField(
            obscureText: obscureText,
            style: textStyle,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                  border: inputBorder,
                enabledBorder: inputBorder,
                disabledBorder: inputBorder,
                errorBorder: inputBorder,
                focusedBorder: inputBorder,
                focusedErrorBorder: inputBorder
              )
          ),
        ),
      ],
    );
  }
}