import 'package:app/common/color_extension.dart';
import 'package:app/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    fireOpenApp();
  }

  void fireOpenApp() async {
    await Future.delayed(const Duration(seconds: 3));
    startApp();
  }

  void startApp() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeView()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/img/splash_logo.png",
              width: media.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Powered by S&S Innovations', // Your chosen text
                style: TextStyle(
                  color: Colors.white.withOpacity(
                      0.6), // Lighter color with opacity for subtle effect
                  fontSize: 14.0, // Slightly smaller font size
                  fontStyle: FontStyle
                      .italic, // Optional to make it look even more subtle
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
