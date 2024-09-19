import 'package:blood_donation/pages/participated_page.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class EventPage extends StatelessWidget {
  final Event event;

  const EventPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Event Image
            Image.asset(
              event.image,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Name
                  Text(
                    event.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  // Event Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Location
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.red),
                          const SizedBox(width: 4.0),
                          Text(
                            event.location,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ), // Distance (Placeholder)
                      Row(
                        children: [
                          const Icon(Icons.directions_walk, color: Colors.grey),
                          const SizedBox(width: 4.0),
                          Text(
                            "7 minutes",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date
                      Row(
                        children: [
                          const Icon(Icons.event, color: Colors.red),
                          const SizedBox(width: 4.0),
                          Text(
                            event.date,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ), // Participants (Placeholder)
                      Row(
                        children: [
                          const Icon(Icons.people, color: Colors.grey),
                          const SizedBox(width: 4.0),
                          Text(
                            "250 participants",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Description
                  Text(
                    event.description,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24.0),
                  // Participate Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParticipatedPage(),
                          ),
                        );
                      },
                      child: const Text("Participer"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
