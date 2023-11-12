import 'package:blood_donation/pages/leadearbordpage.dart';
import 'package:flutter/material.dart';

import '../datamodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? selectedDonationHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(kotkot.image),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      width: 40,
                      child: Image(image: AssetImage('images/blood.png')),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 5,
                      child: Text(
                        '${kotkot.points}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          kotkot.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(Icons.qr_code),
                        ),
                      ],
                    ),
                    Text(
                      "cin: ${kotkot.cin}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "Age: ${kotkot.age}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "Groupe sanguin: ${kotkot.groupeSanguin}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LeaderboardPage()), //TODO: Change this
                );
              },
              child: const Text("Demander un don")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProfilePage()), //TODO: Change this
                );
              },
              child: const Text("Suivre mes demandes")),
          const Divider(),

// Donation history section
          Text(
            "Historique des dons:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 300, // Specify a height for the ListView
            child: ListView.builder(
              itemCount: donationHistory.length,
              itemBuilder: (context, index) {
                final donation = donationHistory[index];
                return ListTile(
                  title: Text(donation.date),
                  subtitle: Text(donation.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
