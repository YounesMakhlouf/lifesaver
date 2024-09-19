import 'package:blood_donation/pages/widgets/score.dart';
import 'package:flutter/material.dart';
import '../../data_model.dart';
import '../qr_code_page.dart';

class ProfileHeader extends StatelessWidget {

  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: Stack(
            children: [
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
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    currentUser.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QrCodePage()),
                      );
                    },
                  ),
                ],
              ),
              Text("CIN: ${currentUser.cin}"),
              Text("Âge: ${currentUser.age}"),
              Text("Groupe sanguin: ${currentUser.groupeSanguin}"),
            ],
          ),
        ),
      ],
    );
  }
}
