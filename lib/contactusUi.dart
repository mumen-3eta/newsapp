import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactusUiState();
  }
}

class ContactusUiState extends State<ContactusUi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                openWhatsApp();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.whatsapp,
                    size: 30,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'WhatsApp'.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                openEmail();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Email'.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                openSMS();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.sms_outlined,
                    size: 30,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'SMS'.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  openWhatsApp() async {
    String whatsApp =
        "whatsapp://send?phone=970567773655&text=${Uri.encodeFull('')}";
    {
      launchUrl(
        Uri.parse(whatsApp),
      );
    }
  }

  openEmail() async {
    String email = "mailto:mumen.3eta@gmail.com?subject=&body=";
    {
      launchUrl(
        Uri.parse(email),
      );
    }
  }

  openSMS() {
    String sms = "sms:0567773655";
    {
      launchUrl(
        Uri.parse(sms),
      );
    }
  }
}
