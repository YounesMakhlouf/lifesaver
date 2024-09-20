import 'package:blood_donation/pages/widgets/user_item.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';
import 'profile_page.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserItem(
            user: user,
            rank: index + 1,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(user: user)),
              );
            },
          );
        },
      ),
    );
  }
}
