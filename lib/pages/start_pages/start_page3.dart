import 'package:blood_donation/pages/authenticate/login_page.dart';
import 'package:blood_donation/pages/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Main3Page extends StatelessWidget {
  const Main3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/main3.png"),
                ),
                const Padding(
                  padding: EdgeInsets.all(35.0),
                  child: Text(
                    "Saisissez l'opportunité de promouvoir vos événements de don du sang. Partagez vos initiatives, rassemblez la communauté et œuvrez ensemble pour un impact concret.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: 2,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("Se connecter")),
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
                          MaterialPageRoute(
                              builder: (context) => const SigninPage()),
                        );
                      },
                      child: const Text("Créer un compte")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
