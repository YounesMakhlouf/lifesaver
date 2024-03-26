import 'package:blood_donation/pages/demande_don.dart';
import 'package:blood_donation/pages/demandes_don_page.dart';
import 'package:blood_donation/pages/qr_code_page.dart';
import 'package:blood_donation/pages/widgets/score.dart';
import 'package:blood_donation/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final donationHistory = currentUser.donationHistory;

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
                      backgroundImage: AssetImage(currentUser.image),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      width: 40,
                      child: Score(points: currentUser.points),
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
                          currentUser.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QrCodePage()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(Icons.qr_code),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "cin: ${currentUser.cin}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "Age: ${currentUser.age}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "Groupe sanguin: ${currentUser.groupeSanguin}",
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
                  MaterialPageRoute(builder: (context) => const DemandeDon()),
                );
              },
              child: const Text("Demander un don")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DemandesPage()),
                );
              },
              child: const Text("Suivre mes demandes")),
          ElevatedButton(
              child: const Text('Se déconnecter'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Wrapper()),
                );
              }),
          const Divider(),

// Donation history section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              donationHistory != null
                  ? "Historique des dons:"
                  : "Soyez un héros, donnez du sang ! 💪🩸",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          if (donationHistory != null)
            SizedBox(
              height: 300, // Specify a height for the ListView
              child: ListView.builder(
                itemCount: currentUser.donationHistory!.length,
                itemBuilder: (context, index) {
                  final donation = currentUser.donationHistory?[index];
                  return ListTile(
                    title: Text(donation!.date),
                    subtitle: Text(donation.location),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
