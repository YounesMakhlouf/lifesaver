import 'package:blood_donation/pages/profile_page.dart';
import 'package:blood_donation/pages/event_page.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Faites un don aujourd'hui et gagnez 10 points !"),
          )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventItem(
                  event: event,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}

class EventItem extends StatelessWidget {
  final Event event;
  final Function onPress;

  const EventItem({super.key, required this.event, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventPage(event: event)),
            );
          },
          child: Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(event.image),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          event.name,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                      Row(children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.map, color: Colors.red),
                        ),
                        Text(
                          event.location,
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
