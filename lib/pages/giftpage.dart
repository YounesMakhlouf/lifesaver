import 'package:blood_donation/pages/qrcodepage.dart';
import 'package:flutter/material.dart';

import '../datamodel.dart';

class GiftPage extends StatelessWidget {
  final Reward reward;

  const GiftPage({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(reward.image),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            reward.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              const Icon(Icons.location_on),
                              Text(
                                reward.location,
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                            ]),
                            Row(
                              children: [
                                const Icon(Icons.local_taxi),
                                Text(
                                  "7 minutes",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    'images/blood.png',
                                    width: 20,
                                  ),
                                ),
                                Text("${reward.cost} points"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  reward.description,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, height: 3.0),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QrCodePage()),
                          );
                        },
                        child: const Text("Profiter")),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
