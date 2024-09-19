import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data_model.dart';
import '../demande_don.dart';
import '../demandes_don_page.dart';
import '../wrapper.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DemandeDon()),
              );
            },
            child: const Text("Demander un don"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DemandesPage(demandes: demandes)),
              );
            },
            child: const Text("Suivre mes demandes"),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
              child: const Text('Se déconnecter'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Wrapper()),
                );
              }),
        ],
      ),
    );
  }
}
