import 'package:flutter/material.dart';

import '../../data_model.dart';

class DonationHistorySection extends StatelessWidget {
  final List<Donation>? donationHistory;

  const DonationHistorySection({super.key, this.donationHistory});

  @override
  Widget build(BuildContext context) {
    final hasDonations = donationHistory != null && donationHistory!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            hasDonations
                ? "Historique des dons:"
                : "Soyez un héros, donnez du sang ! 💪🩸",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: 8),
        if (hasDonations)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // Disable inner scrolling
            itemCount: donationHistory!.length,
            itemBuilder: (context, index) {
              final donation = donationHistory![index];
              return ListTile(
                leading: const Icon(Icons.bloodtype, color: Colors.red),
                title: Text(donation.date),
                subtitle: Text(donation.location),
              );
            },
          ),
      ],
    );
  }
}
