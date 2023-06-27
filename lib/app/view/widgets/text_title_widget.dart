import 'package:flutter/material.dart';

class TextTitleWidget extends StatefulWidget {
  TextTitleWidget({super.key, required this.text});
  final String text;

  @override
  State<TextTitleWidget> createState() => _TextTitleWidgetState();
}

class _TextTitleWidgetState extends State<TextTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
