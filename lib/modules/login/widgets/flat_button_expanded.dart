import 'package:flutter/material.dart';

enum FlatButtonExpandedType{
  fill, none, outline
}

class FlatButtonExpanded extends StatelessWidget {
  final String label;
  final FlatButtonExpandedType type;
  final VoidCallback onTap;

  const FlatButtonExpanded({
    Key key,
    @required this.label,
    @required this.onTap,
    this.type = FlatButtonExpandedType.fill,
  }) : super(key: key);

  static const _config = {
    FlatButtonExpandedType.fill: {
      "color": Colors.green,
      "textStyle": TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      "border": null,
      "height": 58.0,
    },
    FlatButtonExpandedType.none: {
      "color": Colors.transparent,
      "textStyle": TextStyle(color: Colors.grey, fontSize: 14),
      "border": null,
      "height": 22.0,
    },
    FlatButtonExpandedType.outline: {
      "color": Colors.transparent,
      "textStyle": TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 14 ),
      "border": const Border.fromBorderSide(BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2))),
      "height": 58.0,
    },
  };

  Color get backgroundColor => _config[type]['color'];
  TextStyle get textStyle => _config[type]['textStyle'];
  BoxBorder get border => _config[type]['border'];
  double get height => _config[type]['height'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: border
        ),
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}