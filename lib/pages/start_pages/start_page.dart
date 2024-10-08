import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatelessWidget {
  final int index;
  final String image;
  final String text;
  final Widget? nextPage;
  final List<Widget>? actions;

  const MainPage({
    super.key,
    required this.index,
    required this.image,
    required this.text,
    this.nextPage,
    this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Main Content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(image, height: 350),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 16.0),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                // Navigation Dots and Actions
                Column(
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: index,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotHeight: 16,
                        dotWidth: 16,
                        spacing: 8,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (actions != null)
                      ...actions!
                    else
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            if (nextPage != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => nextPage!),
                              );
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text("Suivant"),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}