import 'package:app/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart'; // For SystemNavigator.pop()

class MyAccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: TColor.button,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/img/shawaiz2.jpg'), // Replace with your image path
            ),
            const SizedBox(height: 16),
            const Text(
              'Muhammad Shawaiz Kashif', // Replace with dynamic name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            RoundButton(
              onPressed: () {
                SystemNavigator.pop(); // This will quit the app
              },
              title: "Quit App",
            ),
          ],
        ),
      ),
    );
  }
}
