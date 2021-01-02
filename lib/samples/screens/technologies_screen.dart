import 'package:flutter/material.dart';

class TechnologiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage(
          'assets/technologies/images/flutter_full.png',
          // 'assets/technologies/images/android_full.png',
          // 'assets/base/images/roipil_logo_text_with_background.png',
        ),
      ),
    );
  }
}