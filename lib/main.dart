import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;

import 'screens/mortgage_page.dart';

final intl = NumberFormat('#,###');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        sliderTheme: SliderThemeData(
          trackHeight: 10,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 12.0,
            disabledThumbRadius: 10.0,
            elevation: 5.0,
          ), // Thumb size
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 20.0,
          ), // Overlay size
          thumbColor: Colors.deepPurple.shade300,
          activeTrackColor: Colors.deepPurple.shade600,
          padding: EdgeInsets.zero,
          trackShape: const RoundedRectSliderTrackShape(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade600,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            alignment: Alignment.center,
            fixedSize: Size(screenSize.width - 100, screenSize.height * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5.0,
          ),
        ),
      ),
      home: const MortgagePage(),
    );
  }
}
