// screens/qr_screen.dart
// Зорилго: qr_flutter багц ашиглан QR код үүсгэх
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // QR кодонд хадгалагдах өгөгдөл (энэ тохиолдолд текст)
    const String qrData = "https://github.com/Nyantai12/4RBiydaaltN2";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Босоо чиглэлд голлуулах
        children: [
          // Гарчиг
          const Text(
            'QR Code Generator',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Тайлбар
          const Text(
            'Доорх QR код уншуулахад таны өгөгдөл харагдана',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // QR CODE - QrImageView widget ашиглан QR код зурна
          QrImageView(
            data: qrData, // QR кодонд хадгалах өгөгдөл
            version: QrVersions.auto, // QR кодын хувилбар (автомат)
            size: 200.0, // QR кодын хэмжээ (200x200 пиксел)
            backgroundColor: Colors.white, // Дэвсгэр өнгө (цагаан)
            errorCorrectionLevel:
                QrErrorCorrectLevel.M, // Алдаа засах түвшин (M - дунд)
          ),

          const SizedBox(height: 30),

          // QR кодонд хадгалсан өгөгдлийг текст хэлбэрээр харуулах
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Өгөгдөл: $qrData',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
