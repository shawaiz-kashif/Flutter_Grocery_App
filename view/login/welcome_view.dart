import 'package:app/common_widget/round_button.dart';
import 'package:app/view/login/sign_in.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Set up sliding animation from bottom to top
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from off-screen (bottom)
      end: Offset.zero, // End at its final position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Trigger the opacity and sliding animation
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0; // Set opacity to 1 (visible)
      });
      _animationController.forward(); // Start sliding animation
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Image.asset(
            "assets/img/welcom_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedOpacity(
                  opacity: _opacity, // Animate opacity
                  duration:
                      const Duration(seconds: 1), // Duration of the fade-in
                  child: SlideTransition(
                    position: _slideAnimation, // Animate position
                    child: Container(
                      width:
                          media.width * 0.85, // Width relative to screen size
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.6), // Semi-transparent background
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // App logo
                          Image.asset(
                            "assets/img/mylogo.png",
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(height: 16),
                          // Welcome text
                          const Text(
                            "Welcome\nto our store",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Subtitle text
                          Text(
                            "Fresh groceries at your doorstep in just 60 minutes!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // "Get Started" button
                          RoundButton(
                            title: "Get Started!",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
