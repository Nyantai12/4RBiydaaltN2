// screens/liquid_refresh_screen.dart
// Зорилго: RefreshIndicator + Lottie ашиглан өвөрмөц гоё refresh loader
// Refresh хийх үед Lottie анимацтай loader харуулна
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LiquidRefreshScreen extends StatefulWidget {
  const LiquidRefreshScreen({super.key});

  @override
  State<LiquidRefreshScreen> createState() => _LiquidRefreshScreenState();
}

class _LiquidRefreshScreenState extends State<LiquidRefreshScreen> {
  // Refresh хийж байгаа эсэх
  bool _isRefreshing = false;

  // Сэргээх функц - refresh хийх
  Future<void> _handleRefresh() async {
    setState(() {
      _isRefreshing = true;
    });

    // 2 секунд хүлээх (loading процесс)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        // RefreshIndicator тохиргоо
        onRefresh: _handleRefresh,
        displacement: 120, // Loader харагдах зай
        color: Colors.transparent, // Default спиннерыг нуух
        backgroundColor: Colors.transparent,

        // CUSTOM LOADER - Lottie анимац
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // REFRESH LOADER ХЭСЭГ (refresh хийж байх үед харагдана)
                  if (_isRefreshing)
                    Container(
                      height: 750,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.shade100,
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Lottie анимац - Refresh loader
                          Lottie.network(
                            'https://lottie.host/3f86e97e-7f02-4f18-8a74-1f4f4e6b8fc5/RojEK4lwqZ.json',
                            width: 350,
                            height: 350,
                            repeat: true,
                            animate: true,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Шинэчилж байна...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  // ҮНДСЭН АГУУЛГА (зөвхөн заавар текст)
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100),
                        Text(
                          '👇 Доош татаж шинэчлэх 👇',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
