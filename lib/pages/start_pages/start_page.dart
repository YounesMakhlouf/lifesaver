import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatelessWidget {
  final String image;
  final String text;
  final dynamic nextPage;

  const MainPage(
      {super.key,
      required this.image,
      required this.text,
      required this.nextPage});

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
                  child: Image.asset(image),
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                    activeIndex: 0,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.red,
                    ),
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
                          MaterialPageRoute(builder: (context) => nextPage),
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
