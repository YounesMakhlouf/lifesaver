import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "📅 Événement à proximité ! Ne manquez pas la collecte de sang près de chez vous"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "🌟 Bravo ! Vous avez effectué un don réussi. Vous avez gagné 10 points. "),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "🎁 Nouvelle offre ! Explorez nos avantages exclusifs. Découvrez-les maintenant et profitez-en ."),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "📆 Votre participation à l'événement de don du sang est confirmée. Soyez prêt à sauver des vies !"),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
