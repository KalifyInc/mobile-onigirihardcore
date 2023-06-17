import 'package:OnigiriHardcore/app/controller/drawer_link_controller.dart';
import 'package:OnigiriHardcore/app/view/widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var controller = DrawerLinkController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
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
          DrawerItemWidget(text: "Filmes", linkNavigation: '/movies'),
          DrawerItemWidget(text: "Jogos", linkNavigation: '/games'),
          TextButton(
            onPressed: () => DrawerLinkController.launchURL(
                'https://onigiri-hardcore.blogspot.com/'),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 17),
            ),
            child: const Text('OH: Arquivos',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          TextButton(
            onPressed: () =>
                DrawerLinkController.launchURL('https://kalify.vercel.app/'),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 19),
            ),
            child: const Text('Kalify Inc',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
