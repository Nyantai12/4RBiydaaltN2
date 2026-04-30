// screens/wave_progress_screen.dart
// Зорилго: wave_progress_indicator багц ашиглан шингэн долгионт прогресс харуулах
// Энэ нь mesh_gradient-ийн оронд хэрэглэгдэнэ
import 'package:flutter/material.dart';
import 'package:wave_progress_indicator/wave_progress_indicator.dart';

class WaveProgressScreen extends StatefulWidget {
  const WaveProgressScreen({super.key});

  @override
  State<WaveProgressScreen> createState() => _WaveProgressScreenState();
}

class _WaveProgressScreenState extends State<WaveProgressScreen>
    with SingleTickerProviderStateMixin {
  // Прогрессийн утга (0.0 - 1.0 хооронд)
  double _progressValue = 0.0;

  // Долгионы хурд
  double _speed = 1.0;

  // Долгионы өндөр (амплитуд)
  double _waveHeight = 20.0;

  // Прогрессийг нэмэгдүүлэх функц
  void _increaseProgress() {
    setState(() {
      if (_progressValue < 1.0) {
        _progressValue = (_progressValue + 0.1).clamp(0.0, 1.0);
      }
    });
  }

  // Прогрессийг дахин тохируулах функц
  void _resetProgress() {
    setState(() {
      _progressValue = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wave Progress Indicator'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. WAVE PROGRESS INDICATOR - Үндсэн долгионт прогресс
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.6),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipOval(
                child: WaveProgressIndicator(
                  // Заавал өгөх параметр - прогрессийн утга (0.0 - 1.0)
                  value: _progressValue,

                  // Градиент өнгөнүүд (долгионы дүүргэлт)
                  gradientColors: const [
                    Colors.blue,
                    Colors.purple,
                    Colors.cyan,
                  ],

                  // Долгионы өндөр (өндөр байх тусам долгион их)
                  waveHeight: _waveHeight,

                  // Анимацийн хурд (их байх тусам хурдан)
                  speed: _speed,

                  // Бөөрөнхий булан
                  borderRadius: BorderRadius.circular(0), // Тойрог хэлбэрт 0

                  // Дотор байрлуулах widget (текст)
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(_progressValue * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Прогресс',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 3. ТОВЧНУУД - Прогресс нэмэх, дахин тохируулах
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Нэмэх товч
                ElevatedButton.icon(
                  onPressed: _increaseProgress,
                  icon: const Icon(Icons.add),
                  label: const Text('10% Нэмэх'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Дахин тохируулах товч
                OutlinedButton.icon(
                  onPressed: _resetProgress,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Дахин тохируулах'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
