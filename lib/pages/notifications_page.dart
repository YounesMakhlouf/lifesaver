import 'package:blood_donation/pages/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notifications = [
      const NotificationItem(
        message:
            "Événement à proximité ! Ne manquez pas la collecte de sang près de chez vous",
        icon: Icons.event_available,
      ),
      const NotificationItem(
        message:
            "Bravo ! Vous avez effectué un don réussi. Vous avez gagné 10 points.",
        icon: Icons.star,
      ),
      const NotificationItem(
        message:
            "Nouvelle offre ! Explorez nos avantages exclusifs. Découvrez-les maintenant et profitez-en.",
        icon: Icons.card_giftcard,
      ),
      const NotificationItem(
        message:
            "Votre participation à l'événement de don du sang est confirmée. Soyez prêt à sauver des vies !",
        icon: Icons.check_circle,
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return notifications[index];
        },
      ),
    );
  }
}
