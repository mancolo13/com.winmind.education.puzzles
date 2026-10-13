import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final quests = [
      {'title': 'Решить 3 числовые матрицы', 'reward': '+50 XP', 'done': true},
      {'title': 'Точность 90%+ в скоростном тесте', 'reward': '+80 XP', 'done': true},
      {'title': 'Пройти блиц за 90 секунд', 'reward': '+100 XP', 'done': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('WinMind • Daily'),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ежедневный стрик ума', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Вы решаете задачи каждый день', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                  Text('🔥 12 Дней', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Задания на сегодня', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...quests.map((q) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Icon(q['done'] as bool ? Icons.check_circle : Icons.radio_button_unchecked, color: q['done'] as bool ? AppTheme.primaryColor : Colors.white30),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(q['title'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  Text(q['reward'] as String, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
