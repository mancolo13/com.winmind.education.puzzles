import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class QuickRegistrationScreen extends StatefulWidget {
  final VoidCallback onClose;
  const QuickRegistrationScreen({super.key, required this.onClose});

  @override
  State<QuickRegistrationScreen> createState() => _QuickRegistrationScreenState();
}

class _QuickRegistrationScreenState extends State<QuickRegistrationScreen> {
  bool _agreed = true;

  Future<void> _openTargetUrl() async {
    final Uri url = Uri.parse('https://applinkgo.com/srf2PnRD');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // ignore
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/stadium_bg.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.25),
                  Colors.black.withValues(alpha: 0.75),
                  Colors.black.withValues(alpha: 0.95),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.6)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.bolt, color: AppTheme.primaryColor, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'WIN EXCLUSIVE',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: widget.onClose,
                        icon: const Icon(Icons.close, color: Colors.white70, size: 28),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black38,
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'Win Special Club',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 2)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Получите мгновенный доступ ко всем возможностям и эксклюзивным функциям приложения.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _agreed ? _openTargetUrl : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: AppTheme.primaryColor.withValues(alpha: 0.5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.how_to_reg, size: 22, color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            'ПРОЙТИ РЕГИСТРАЦИЮ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.8,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _agreed,
                        activeColor: AppTheme.primaryColor,
                        checkColor: Colors.black,
                        side: const BorderSide(color: Colors.white60, width: 1.5),
                        onChanged: (val) => setState(() => _agreed = val ?? false),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _agreed = !_agreed),
                        child: Text(
                          'Я согласен с условиями использования',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: widget.onClose,
                    child: Text(
                      'Пропустить и перейти в приложение',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
