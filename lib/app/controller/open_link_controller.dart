import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../view/widgets/global_snackbar_widget.dart';

class OpenLinkController {
  openLink({required BuildContext context, required String urlParam}) async {
    Uri url = Uri.parse(urlParam);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      GlobalSnackBarWidget.show(
          context, 'Erro: ${e.toString()}', Colors.redAccent);
    }
  }
}
