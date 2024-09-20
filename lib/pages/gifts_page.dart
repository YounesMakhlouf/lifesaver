import 'package:flutter/material.dart';

import '../models/data_model.dart';
import 'profile_page.dart';
import 'gift_page.dart';

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
                MaterialPageRoute(builder: (context) => ProfilePage(user: currentUser)),
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GiftPage(reward: reward)),
            );
          },
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(reward.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 350,
                            child: Text(
                              "${reward.name} chez ${reward.location}",
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
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
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
