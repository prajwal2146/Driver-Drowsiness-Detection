import 'package:url_launcher/url_launcher.dart';

void reportCrime() async {
  String uri = 'https://ners.in/';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    // iOS
    const uri = 'https://ners.in/';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
