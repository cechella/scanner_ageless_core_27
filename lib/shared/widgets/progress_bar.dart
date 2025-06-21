import 'package:flutter/material.dart';

class AgelessProgressBar extends StatelessWidget {
  final int metabolicAge;
  final int targetAge;

  const AgelessProgressBar({
    super.key,
    required this.metabolicAge,
    this.targetAge = 27,
  });

  @override
  Widget build(BuildContext context) {
    final totalRange = 60; // faixa de idade considerada
    final progress = ((60 - metabolicAge) / (60 - targetAge)).clamp(0.0, 1.0);
    final yearsToTarget = (metabolicAge - targetAge).clamp(0, 60);
    final percent = (progress * 100).toStringAsFixed(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "🧬 Seu destino: AGELESS aos 27 anos",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.cyanAccent,
                      Colors.blueAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$metabolicAge anos",
              style: const TextStyle(color: Colors.cyanAccent),
            ),
            Text(
              "$targetAge anos",
              style: const TextStyle(color: Colors.cyanAccent),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          "Faltam $yearsToTarget anos • $percent% concluído",
          style: const TextStyle(color: Colors.white60, fontSize: 13),
        ),
      ],
    );
  }
}
