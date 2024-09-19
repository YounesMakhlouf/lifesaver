import 'package:blood_donation/pages/widgets/donation_history.dart';
import 'package:blood_donation/pages/widgets/profile_actions.dart';
import 'package:blood_donation/pages/widgets/profile_header.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const ProfileActions(),
            const Divider(),
            DonationHistorySection(donationHistory: currentUser.donationHistory)
          ],
        ),
      ),
    );
  }
}
