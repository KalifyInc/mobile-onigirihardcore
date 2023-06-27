import 'package:OnigiriHardcore/app/view/widgets/text_title_card_widget.dart';
import 'package:flutter/material.dart';

import '../pages/card_inside_page.dart';

class CardHomeWidget extends StatefulWidget {
  CardHomeWidget({
    super.key,
    required this.title,
    required this.categories,
    required this.date,
    required this.imageURL,
    required this.bodyPost,
    required this.author,
    required this.detailDate,
    required this.slug,
  });

  final String title;
  final String categories;
  final String date;
  final String imageURL;
  final String bodyPost;
  final String author;
  final String detailDate;
  final String slug;

  @override
  State<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends State<CardHomeWidget> {
  methodname(String categoriesParams) {
    switch (categoriesParams) {
      case 'Technologies':
        return 'Tecnologias';
      case 'Animes':
        return "Animes & HQ's";
      case 'Games':
        return 'Vídeo Games';
      case 'Movies':
        return 'Filmes & Séries';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.tealAccent,
        onTap: () {
          debugPrint('Card tapped.');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardInsidePage(
                    imageURL: widget.imageURL,
                    title: widget.title,
                    date: widget.date,
                    detailDate: widget.detailDate,
                    categories: widget.categories,
                    bodyPost: widget.bodyPost,
                    author: widget.author,
                    slug: widget.slug)),
          );
        },
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
                    '${widget.date} - ',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    '${methodname(widget.categories)}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
