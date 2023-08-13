import 'package:flutter/material.dart';

class TextTitleCardWidget extends StatefulWidget {
  const TextTitleCardWidget({super.key, required this.text});
  final String text;

  @override
  State<TextTitleCardWidget> createState() => _TextTitleCardWidgetState();
}

class _TextTitleCardWidgetState extends State<TextTitleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }
}
