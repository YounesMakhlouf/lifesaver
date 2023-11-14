import 'package:blood_donation/pages/main3page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Main2Page extends StatelessWidget {
  const Main2Page({super.key});

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
                Image.asset("images/main2.png"),
                const Padding(
                  padding: EdgeInsets.all(35.0),
                  child: Text(
                    "Découvrez les avantages spéciaux qui vous attendent en tant que donneur dévoué : récompenses exclusives, accès à des événements réservés, et bien plus encore.",
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
                const AnimatedSmoothIndicator(
                  activeIndex: 1,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Main3Page()),
                        );
                      },
                      child: const Text("SUIVANT")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
