// main.dart - Үндсэн апп, MotionTabBar ашигласан
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:package_demo/screens/confetti_screen.dart';
import 'screens/qr_screen.dart';
import 'screens/animated_text_screen.dart';
import 'screens/refresh_screen.dart';
import 'screens/wave_indicator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainTabScreen(),
    );
  }
}

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const QRScreen(),
    const AnimatedTextScreen(),
    const LiquidRefreshScreen(),
    const WaveProgressScreen(), // MotionTabBar-ийн жишээ өөр screen дотор
    const ConfettiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('5 Package')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "QR",
        labels: const ["QR", "TextAnim", "Refresh", "MotionTab", "Confetti"],
        icons: const [
          Icons.qr_code,
          Icons.text_fields,
          Icons.refresh,
          Icons.animation,
          Icons.games,
        ],
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.blue,
        onTabItemSelected: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
