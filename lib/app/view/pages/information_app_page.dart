import 'package:flutter/material.dart';

import '../../controller/open_link_controller.dart';

class InformationAppPage extends StatefulWidget {
  const InformationAppPage({super.key});

  @override
  State<InformationAppPage> createState() => _InformationAppPageState();
}

class _InformationAppPageState extends State<InformationAppPage> {
  final currentYear = DateTime.now().year;
  final controller = OpenLinkController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              AppBar(title: const Text('Onigiri Hardcore'), centerTitle: true),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                        'https://onigirihardcore.vercel.app/logotipo-white.png'),
                    const SizedBox(height: 32),
                    const Text(
                      'Versão 1.0.0',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '2015 - $currentYear Kalify Inc.',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () => controller.openLink(
                            context: context,
                            urlParam: 'mailto:anderson18.marlon@gmail.com'),
                        child: const Text(
                          'Contate-nos',
                          style: TextStyle(fontSize: 14),
                        )),
                    TextButton(
                        onPressed: () => controller.openLink(
                            context: context,
                            urlParam: 'https://onigirihardcore.com.br/'),
                        child: const Text(
                          'Site oficial',
                          style: TextStyle(fontSize: 14),
                        )),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
