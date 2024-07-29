import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String logoPath;
  final String imagePath;
  final String title;
  final String description;

  const OnboardingScreen({
    super.key,
    required this.logoPath,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoPath, height: 80),
              SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imagePath, height: 220),
              ),
              SizedBox(height: 40),
              Text(title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: 100),

              // Text(description,
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
