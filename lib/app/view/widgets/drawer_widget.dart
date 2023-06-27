import 'package:OnigiriHardcore/app/view/widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/open_link_controller.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final controller = OpenLinkController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://onigirihardcore.vercel.app/logotipo-white.png'),
                ),
              ),
              child: null),
          DrawerItemWidget(text: 'Inicio', linkNavigation: '/home'),
          DrawerItemWidget(text: 'Notícias', linkNavigation: '/noticias'),
          DrawerItemWidget(text: "Animes & HQ'S", linkNavigation: '/animes'),
          DrawerItemWidget(text: "Filmes & Séries", linkNavigation: '/movies'),
          DrawerItemWidget(text: "Vídeo Games", linkNavigation: '/games'),
          DrawerItemWidget(
              text: "Tecnologias", linkNavigation: '/technologies'),
          TextButton(
            onPressed: () =>
                controller.openLink('https://onigiri-hardcore.blogspot.com/'),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 17),
            ),
            child: const Text('OH: Arquivos',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          TextButton(
            onPressed: () => controller.openLink('https://kalify.vercel.app/'),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 19),
            ),
            child: const Text('Kalify Inc',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          DrawerItemWidget(text: "Sobre", linkNavigation: '/informationApp'),
        ],
      ),
    );
  }
}
