// screens/confetti_screen.dart
// Зорилго: Confetti багц ашиглан баяр ёслолын эффект (цаасан шүршигч) харуулах
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class ConfettiScreen extends StatefulWidget {
  const ConfettiScreen({super.key});

  @override
  State<ConfettiScreen> createState() => _ConfettiScreenState();
}

class _ConfettiScreenState extends State<ConfettiScreen> {
  // ConfettiController - confetti-г удирдах контроллер
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    // ConfettiController үүсгэх - confetti хэрэглэх хугацааг 3 секунд болгож тохируулсан
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    // Санах ойгоос чөлөөлөх - заавал хийх ёстой (memory leak-ээс сэргийлнэ)
    _confettiController.dispose();
    super.dispose();
  }

  // Confetti-г эхлүүлэх функц
  void _playConfetti() {
    _confettiController.play(); // Confetti цацаж эхлэх 🎉
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Stack - дэвсгэр дээр элементүүдийг давхарлан байрлуулах
      children: [
        // 1. ҮНДСЭН АГУУЛГА (Урд талын хэсэг)
        Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Босоо чиглэлд голлуулах
            children: [
              // Гарчиг текст
              const Text(
                'Confetti animation🎉',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // 20px зай

              // Дэд гарчиг
              const Text(
                'Баяр ёслолын эффект!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 50), // 50px зай

              // Товч - дарвал confetti цацагдана
              ElevatedButton(
                onPressed:
                    _playConfetti, // Товч дархад _playConfetti функц ажиллана
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15), // Товчны дотор зай
                  backgroundColor: Colors.red, // Улаан дэвсгэр
                  foregroundColor: Colors.white, // Цагаан текст
                  textStyle: const TextStyle(fontSize: 18), // Үсгийн хэмжээ
                ),
                child: const Text('🎊 Амжилтаа тэмдэглэх 🎊'),
              ),
            ],
          ),
        ),

        // 2. CONFETTI ЭФФЕКТ (Арын хэсэг - дээр нь давхарлан харуулна)
        Align(
          alignment: Alignment.topCenter, // Confetti дээд талаас цацагдана
          child: ConfettiWidget(
            // confettiController - заавал өгөх ёстой параметр (confetti-г удирдах)
            confettiController: _confettiController,

            // blastDirectionality - Цацах чиглэл
            // BlastDirectionality.explosive - бүх чиглэлд тэсрэх мэт цацана
            blastDirectionality: BlastDirectionality.explosive,

            // shouldLoop - Давтах эсэх (false бол нэг удаа цацаад зогсоно)
            shouldLoop: false,

            // numberOfParticles - Нэг удаад цацагдах тоосонцорын тоо
            numberOfParticles: 30,

            // gravity - Унах хурд (0-1 хооронд, их байх тусам хурдан унана)
            gravity: 0.2,

            // colors - Цацагдах цаасануудын өнгөнүүд
            colors: const [
              Colors.red, // Улаан
              Colors.green, // Ногоон
              Colors.blue, // Цэнхэр
              Colors.yellow, // Шар
              Colors.purple, // Ягаан
              Colors.orange, // Улбар шар
              Colors.pink, // Ягаан
            ],
          ),
        ),
      ],
    );
  }
}
