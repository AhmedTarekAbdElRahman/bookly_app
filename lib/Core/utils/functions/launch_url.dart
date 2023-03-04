import 'package:bookly/Core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? uri) async {
  if (uri != null) {
    Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      customSnackBar(context, 'Cannot launch this $url');
    }
  }
}

