import 'package:flutter/material.dart';

import '../authenticate/login_page.dart';
import '../authenticate/sign_in.dart';
import 'start_page.dart';

class Main3Page extends MainPage {
  const Main3Page({
    super.key,
    super.index = 2,
    super.image = 'images/main3.png',
    super.text =
    "Saisissez l'opportunité de promouvoir vos événements de don du sang. Partagez vos initiatives, rassemblez la communauté et œuvrez ensemble pour un impact concret.",
    super.actions,
  });

  @override
  Widget build(BuildContext context) {
    return MainPage(
      index: index,
      image: image,
      text: text,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text("Se connecter"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SigninPage()),
              );
            },
            child: const Text("Créer un compte"),
          ),
        ),
      ],
    );
  }
}