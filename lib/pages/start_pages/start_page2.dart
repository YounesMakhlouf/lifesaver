import 'package:blood_donation/pages/start_pages/start_page.dart';
import 'package:blood_donation/pages/start_pages/start_page3.dart';
import 'package:flutter/material.dart';

class Main2Page extends MainPage {
  const Main2Page(
      {super.key,
      super.image = 'images/main2.png',
      super.nextPage,
      super.text =
          'Découvrez les avantages spéciaux qui vous attendent en tant que donneur dévoué : récompenses exclusives, accès à des événements réservés, et bien plus encore.'});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      image: image,
      text: text,
      nextPage: const Main3Page(),
    );
  }
}
