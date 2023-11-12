import 'package:flutter/material.dart';

import '../datamodel.dart';
import 'ProfilePage.dart';
import 'giftpage.dart';

class GiftsPage extends StatelessWidget {
  const GiftsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return RewardItem(
            reward: reward,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            });
      },
    );
  }
}

class RewardItem extends StatelessWidget {
  final Reward reward;
  final Function onPress;

  const RewardItem({super.key, required this.reward, required this.onPress});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${reward.name} chez ${reward.location}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(
                                  'images/blood.png',
                                  width: 20,
                                ),
                              ),
                              Text("${reward.cost}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GiftPage(reward: reward)),
                          );
                        },
                        child: const Text("Voir")),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
