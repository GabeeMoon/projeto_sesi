import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Obrigado!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              '😊',
              style: TextStyle(fontSize: 64),
            ),
          ],
        ),
      ),
    );
  }
}
