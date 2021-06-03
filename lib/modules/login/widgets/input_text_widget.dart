import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  const InputTextWidget({
    Key key,
    @required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(this.label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        TextField(
            decoration: InputDecoration(border: OutlineInputBorder())
        ),
      ],
    );
  }
}