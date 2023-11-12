import 'package:flutter/material.dart';

import '../datamodel.dart';

class EventPage extends StatelessWidget {
  final Event event;

  const EventPage({super.key, required this.event});

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            event.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              Icon(Icons.location_on),
                              Text(
                                event.location,
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                            ]),
                            Row(
                              children: [
                                Icon(Icons.local_taxi),
                                Text(
                                  "7 minutes",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.event),
                                Text(
                                  event.date,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.groups),
                                Text(
                                  "250 participants",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  event.description,
                  style: TextStyle(fontWeight: FontWeight.bold, height: 3.0),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventPage(event: event)),
                          );
                        },
                        child: const Text("Participer")),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
