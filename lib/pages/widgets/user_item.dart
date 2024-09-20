import 'package:blood_donation/pages/widgets/score.dart';
import 'package:flutter/material.dart';

import '../../models/data_model.dart';

class UserItem extends StatelessWidget {
  final nUser user;
  final VoidCallback onPress;
  final int rank;

  const UserItem({
    super.key,
    required this.user,
    required this.onPress,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: CircleAvatar(
        backgroundImage: AssetImage(user.image),
        radius: 25,
      ),
      title: Text(
        user.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text('Rang: $rank'),
      trailing: Score(points: user.points),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
