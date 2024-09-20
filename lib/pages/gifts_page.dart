import 'package:blood_donation/pages/widgets/list_item.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';
import 'gift_page.dart';

class GiftsPage extends StatelessWidget {
  final List<Reward> rewards;

  const GiftsPage({
    super.key,
    required this.rewards,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return ListItem(
          imageUrl: reward.image,
          title: "${reward.name} chez ${reward.location}",
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GiftPage(reward: reward),
              ),
            );
          },
          trailingWidget: Padding(
            padding: const EdgeInsets.all(16.0),
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
        );
      },
    );
  }
}
