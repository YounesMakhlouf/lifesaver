import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int points;

  const Score({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            'images/blood.png',
            width: 35,
          ),
        ),
        Positioned(
          right: 15,
          bottom: 5,
          child: Text(
            '$points',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
