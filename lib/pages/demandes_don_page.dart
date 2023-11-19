import 'package:flutter/material.dart';

import '../data_model.dart';
import 'profile_page.dart';

class DemandesPage extends StatelessWidget {
  const DemandesPage({super.key});
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
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            });
      },
    );
  }
}

class DemandeItem extends StatelessWidget {
  final Demande demande;
  final Function onPress;

  const DemandeItem({super.key, required this.demande, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.event, color: Colors.red),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        demande.date,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      demande.description,
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      softWrap: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
