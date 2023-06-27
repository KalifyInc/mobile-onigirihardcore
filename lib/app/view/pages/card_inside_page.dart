import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CardInsidePage extends StatelessWidget {
  CardInsidePage({
    super.key,
    this.image,
    required this.author,
    required this.imageURL,
    required this.title,
    required this.categories,
    required this.date,
    required this.bodyPost,
    required this.detailDate,
  });

  final String? image;
  final String imageURL;
  final String author;
  final String title;
  final String categories;
  final String date;
  final String bodyPost;
  final String detailDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(imageURL)))),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$detailDate | $author'),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Markdown(
                      physics: const BouncingScrollPhysics(),
                      data: bodyPost,
                      shrinkWrap: true,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
