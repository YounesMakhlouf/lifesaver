import 'package:blood_donation/pages/widgets/donation_history.dart';
import 'package:blood_donation/pages/widgets/profile_actions.dart';
import 'package:blood_donation/pages/widgets/profile_header.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';
import '../services/auth.dart';

class ProfilePage extends StatelessWidget {
  final nUser user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService auth = FirebaseAuthService();
    final currentUserUid = auth.getCurrentUser()?.uid;
    final isCurrentUserProfile = user.uid == currentUserUid;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(user: user),
            if (isCurrentUserProfile) const ProfileActions(),
            const Divider(),
            DonationHistorySection(donationHistory: user.donationHistory)
          ],
        ),
      ),
    );
  }
}
