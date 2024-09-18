import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int points;

  const Score({
    super.key,
    required this.points,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'images/blood.png',
            width: 35,
            semanticLabel: 'Blood drop icon',
          ),
          Positioned(
            right: 8,
            bottom: 5,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$points',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}