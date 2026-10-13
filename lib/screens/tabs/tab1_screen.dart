import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  int _selectedOption = -1;
  final _options = ['Эхо', 'Облако', 'Тень', 'Зеркало'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • Play'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.35)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppTheme.primaryColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                    child: const Text('ЗАГАДКА ДНЯ • IQ 130+', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                  const SizedBox(height: 12),
                  const Text('«Я говорю без рта и слышу без ушей. У меня нет тела, но я оживаю от ветра. Что я?»', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, height: 1.4)),
                  const SizedBox(height: 16),
                  ...List.generate(_options.length, (i) {
                    final sel = _selectedOption == i;
                    final correct = i == 0;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedOption = i),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: sel ? (correct ? Colors.green.withValues(alpha: 0.3) : Colors.red.withValues(alpha: 0.3)) : AppTheme.cardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: sel ? (correct ? Colors.greenAccent : Colors.redAccent) : Colors.transparent),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_options[i], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                            if (sel) Icon(correct ? Icons.check_circle : Icons.cancel, color: correct ? Colors.greenAccent : Colors.redAccent, size: 20),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Категории головоломок', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildCat('Логические сетки', 'Дедуктивные задачи Эйнштейна', '18 ур.', Icons.grid_view),
            _buildCat('Числовые последовательности', 'Поиск скрытых формул ряда', '24 ур.', Icons.pin),
            _buildCat('Пространственные фигуры', 'Развертки 3D кубов', '12 ур.', Icons.view_in_ar),
          ],
        ),
      ),
    );
  }

  Widget _buildCat(String name, String desc, String lvl, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(desc, style: const TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
          Text(lvl, style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}
