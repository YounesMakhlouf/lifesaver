import 'package:flutter/material.dart';

import '../models/data_model.dart';
import 'profile_page.dart';

class DemandesPage extends StatelessWidget {
  final List<Demande> demandes;
  const DemandesPage({super.key, required this.demandes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demandes.length,
      itemBuilder: (context, index) {
        final demande = demandes[index];
        return DemandeItem(
            demande: demande,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(user: currentUser)),
              );
            });
      },
    );
  }
}

class DemandeItem extends StatelessWidget {
  final Demande demande;
  final VoidCallback onPress;

  const DemandeItem({
    super.key,
    required this.demande,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onPress,
        leading: const Icon(Icons.event, color: Colors.red),
        title: Text(
          demande.date,
        ),
        subtitle: Text(
          demande.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
