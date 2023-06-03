import 'package:url_launcher/url_launcher.dart';

class DrawerLinkController {
  static launchURL(String urlParam) async {
    final Uri url = Uri.parse(urlParam);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
