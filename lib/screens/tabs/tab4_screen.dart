import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final ranks = [
      {'pos': '1', 'name': 'Max K.', 'score': '3,420 pts', 'trophy': '🏆'},
      {'pos': '2', 'name': 'Elena V.', 'score': '3,180 pts', 'trophy': '🥈'},
      {'pos': '3', 'name': 'Daniel S.', 'score': '2,950 pts', 'trophy': '🥉'},
      {'pos': '184', 'name': 'You (Player)', 'score': '1,840 pts', 'trophy': '⭐'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Rank'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.3)),
              ),
              child: const Text('Global Erudite Leaderboard', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 16),
            ...ranks.map((r) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: r['pos'] == '184' ? AppTheme.primaryColor.withValues(alpha: 0.15) : AppTheme.cardColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: r['pos'] == '184' ? AppTheme.primaryColor : Colors.transparent),
              ),
              child: Row(
                children: [
                  Text(r['trophy']!, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(r['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  Text(r['score']!, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
