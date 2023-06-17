import 'package:OnigiriHardcore/app/view/widgets/text_title_card_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {super.key,
      required this.title,
      required this.categories,
      required this.date,
      required this.imageURL});

  var title;
  var categories;
  var date;
  var imageURL;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: TextTitleCardWidget(text: widget.title),
            trailing: Image.network(widget.imageURL,
                width: 120, height: 120, fit: BoxFit.fill),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.date + ' - ',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  widget.categories,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
