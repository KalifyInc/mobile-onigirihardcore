import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../controller/open_link_controller.dart';

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
    required this.slug,
  });

  final String? image;
  final String imageURL;
  final String? author;
  final String title;
  final String? categories;
  final String? date;
  final String bodyPost;
  final String detailDate;
  final String slug;

  final controller = OpenLinkController();

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
                    fit: BoxFit.cover,
                    image: NetworkImage(imageURL),
                  ),
                ),
              ),
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
                    TextButton.icon(
                        onPressed: () async =>
                            await Clipboard.setData(ClipboardData(
                                    text:
                                        "https://onigirihardcore.com.br/$slug"))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Link copiado na área de transferência")));
                            }),
                        label: const Text(
                          'Compartilhar',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(Icons.share)),
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
