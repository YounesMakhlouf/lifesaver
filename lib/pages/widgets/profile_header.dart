import 'package:blood_donation/pages/widgets/score.dart';
import 'package:flutter/material.dart';

import '../../models/data_model.dart';
import '../qr_code_page.dart';

class ProfileHeader extends StatelessWidget {
  final nUser user;

  const ProfileHeader({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // For smaller screens, use a Column
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAvatarWithScore(),
                  const SizedBox(height: 16),
                  _buildUserInfo(context),
                ],
              );
            } else {
              // For larger screens, use a Row
              return Row(
                children: [
                  _buildAvatarWithScore(),
                  const SizedBox(width: 16),
                  Expanded(child: _buildUserInfo(context)),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildAvatarWithScore() {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(user.image),
            backgroundColor: Colors.grey.shade200,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            width: 40,
            child: Score(points: user.points),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final TextStyle labelStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey.shade600,
            );
    final TextStyle valueStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.qr_code),
              tooltip: 'Afficher le code QR',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodePage(),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildInfoRow('CIN', '${user.cin}', labelStyle, valueStyle),
        _buildInfoRow('Âge', '${user.age}', labelStyle, valueStyle),
        _buildInfoRow(
            'Groupe sanguin', user.groupeSanguin, labelStyle, valueStyle),
      ],
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    TextStyle labelStyle,
    TextStyle valueStyle,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text('$label: ', style: labelStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
