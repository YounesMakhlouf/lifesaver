import 'package:blood_donation/pages/start_pages/start_page.dart';
import 'package:blood_donation/pages/start_pages/start_page2.dart';
import 'package:flutter/material.dart';

class Main1Page extends MainPage {
  const Main1Page(
      {super.key,
      super.image = 'images/main1.png',
      super.nextPage,
      super.text =
          "Faites un geste simple qui a un impact éternel. Rejoignez-nous dans cette mission de générosité et de vie."});

  @override
  Widget build(BuildContext context) {
    return MainPage(image: image, text: text, nextPage: const Main2Page());
  }
}
