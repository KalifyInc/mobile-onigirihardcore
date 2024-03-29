import 'package:OnigiriHardcore/app/view/widgets/video_player_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_viewer/markdown_viewer.dart';

import '../../controller/open_link_controller.dart';
import '../widgets/global_snackbar_widget.dart';

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
    required this.ytid,
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
  final String ytid;

  final controller = OpenLinkController();

  Widget displayYoutubeVideo() {
    if (ytid == "") {
      return const SizedBox();
    } else {
      return VideoPlayerWidget("https://www.youtube.com/embed/$ytid");
    }
  }

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
                    MarkdownViewer(
                      bodyPost,
                      enableTaskList: true,
                      styleSheet: const MarkdownStyle(
                        listItemMarkerTrailingSpace: 12,
                        codeBlock: TextStyle(
                          fontSize: 14,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    displayYoutubeVideo(),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Acompanhe o Onigiri Hardcore também no ',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Twitter.',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.openLink(
                                    context: context,
                                    urlParam:
                                        'https://twitter.com/OnigiriHardcore');
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: () async => await Clipboard.setData(
                              ClipboardData(
                                  text: "https://onigirihardcore.com.br/$slug"))
                          .then((_) {
                        GlobalSnackBarWidget.show(
                            context,
                            "Link copiado para área de transferência",
                            Colors.lightBlue);
                      }),
                      label: const Text(
                        'Compartilhar',
                        style: TextStyle(fontSize: 16),
                      ),
                      icon: const Icon(Icons.share),
                    ),
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
