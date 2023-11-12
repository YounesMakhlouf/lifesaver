import 'package:blood_donation/pages/ProfilePage.dart';
import 'package:blood_donation/pages/eventpage.dart';
import 'package:flutter/material.dart';

import '../datamodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventItem(
            event: event,
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

class EventItem extends StatelessWidget {
  final Event event;
  final Function onPress;

  const EventItem({super.key, required this.event, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("${event.image}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          event.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(event.location),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(event.date),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventPage(event: event)),
                          );
                        },
                        child: const Text("See More")),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
