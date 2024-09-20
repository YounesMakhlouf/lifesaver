import 'package:blood_donation/pages/event_page.dart';
import 'package:blood_donation/pages/widgets/list_item.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Card(
            color: Colors.red.shade100,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.red, size: 48),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Faites un don aujourd'hui et gagnez 10 points !",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListItem(
                  imageUrl: event.image,
                  title: event.name,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventPage(event: event),
                      ),
                    );
                  },
                  trailingWidget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Event Location
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                event.location,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0), // Event Date
                        Row(
                          children: [
                            const Icon(Icons.event, color: Colors.red),
                            const SizedBox(width: 4.0),
                            Text(
                              event.date,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
