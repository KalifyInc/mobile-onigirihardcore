import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.author,
      required this.categories,
      required this.date,
      required this.imageURL});

  var title;
  var description;
  var author;
  var categories;
  var date;
  var imageURL;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(widget.imageURL),
              title: Text(widget.title),
              subtitle: Text(widget.description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(widget.date),
                const SizedBox(width: 8),
                Text(widget.categories),
                const SizedBox(width: 8),
                Text(widget.author),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
