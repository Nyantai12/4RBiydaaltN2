// screens/animated_text_screen.dart
// Зорилго: animated_text_kit багцын 4 төрлийн эффектийг харуулах
// Бүх анимаци 6 секунд үргэлжилнэ
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTextScreen extends StatelessWidget {
  const AnimatedTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // SingleChildScrollView - Хэрэв дэлгэцний агуулга их байвал гүйлгэх боломж олгоно
      child: SingleChildScrollView(
        child: Column(
          // Бүх элементүүдийг голлуулж байрлуулна
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. TYPEWRITER EFFECT (Бичээрийн эффект)
            // Эффектийн нэр харуулах текст
            const Text(
              'Typewriter Effect:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // 10 пикселийн зай

            // AnimatedTextKit - Хөдөлгөөнт текстийн үндсэн widget
            AnimatedTextKit(
              // animatedTexts - Ажиллуулах анимацуудын жагсаалт
              animatedTexts: [
                // TypewriterAnimatedText - Текст үсэг бүрээр бичигдэж байгаа мэт харагдуулна
                TypewriterAnimatedText(
                  'Hello Flutter!', // Харуулах текст
                  textStyle: const TextStyle(
                      fontSize: 24, // Үсгийн хэмжээ
                      fontWeight: FontWeight.bold, // Тод үсэг
                      color: Colors.blue), // Цэнхэр өнгө
                  speed: const Duration(
                      milliseconds:
                          600), // Үсэг бүрийн хурд: 600мс -> 10үсэг = 6 секунд
                ),
              ],
              totalRepeatCount: 1, // Анимацийг 1 удаа л гүйцэтгэнэ
            ),
            const SizedBox(height: 40), // 40 пикселийн зай

            // 2. FADE EFFECT (Бүдэгрэх эффект)
            const Text(
              'Fade Effect:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                // FadeAnimatedText - Текст аажмаар гарч ирэх эффект
                FadeAnimatedText(
                  'Fading Text', // Харуулах текст
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green), // Ногоон өнгө
                  duration: const Duration(
                      seconds: 6), // Бүрэн гарч ирэх хугацаа: 6 секунд
                ),
              ],
              totalRepeatCount: 1,
            ),
            const SizedBox(height: 40),

            // 3. COLORIZE EFFECT (Өнгө өөрчлөгдөх эффект)
            const Text(
              'Colorize Effect:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                // ColorizeAnimatedText - Текстийн өнгө өөрчлөгдөх эффект
                ColorizeAnimatedText(
                  'Colorful Text', // Харуулах текст
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  // colors - Дараалан өөрчлөгдөх өнгөнүүд
                  colors: [
                    Colors.purple, // Ягаан
                    Colors.blue, // Цэнхэр
                    Colors.red, // Улаан
                    Colors.orange, // Улбар шар
                  ],
                  speed: const Duration(
                      seconds: 2), // Өнгө бүрийн хурд: 2сек x 3 өнгө = 6 секунд
                ),
              ],
              totalRepeatCount: 1,
            ),
            const SizedBox(height: 40),

            // 4. SCALE EFFECT (Томорч жижигрэх эффект)
            const Text(
              'Scale Effect:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                // ScaleAnimatedText - Текст томорч, дараа нь жижигрэх эффект
                ScaleAnimatedText(
                  'Scaling Text', // Харуулах текст
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange, // Улбар шар өнгө
                  ),
                  duration:
                      const Duration(seconds: 6), // Нийт хугацаа: 6 секунд
                ),
              ],
              totalRepeatCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}
