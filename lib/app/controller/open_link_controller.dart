import 'package:url_launcher/url_launcher.dart';

class OpenLinkController {
  openLink(urlParam) async {
    Uri url = Uri.parse(urlParam);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Error: $e');
    }
  }
}
