import 'package:flutter/material.dart';

class DrawerItemWidget extends StatefulWidget {
  DrawerItemWidget(
      {super.key, required this.text, required this.linkNavigation});
  final String text;
  final String linkNavigation;

  @override
  State<DrawerItemWidget> createState() => _DrawerItemWidgetState();
}

class _DrawerItemWidgetState extends State<DrawerItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () {
        // Then close the drawer
        Navigator.pop(context);
        // Update the state of the app
        // setState(() {
        Navigator.pushNamed(context, widget.linkNavigation);
        // });
      },
    );
  }
}
