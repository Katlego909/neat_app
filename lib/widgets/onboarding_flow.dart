import 'package:flutter/material.dart';
import 'package:neat_test_app/widgets/onboarding.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  _OnboardingFlowState createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentPageIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Navigate to the next page or sign in if on the last page
  void goToNextPage() {
    if (_currentPageIndex == onboardingScreens.length - 1) {
      Navigator.pushReplacementNamed(context, '/sign-in');
    } else {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  // Skip the onboarding process and navigate to sign in
  void skipOnboarding() {
    Navigator.pushReplacementNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingScreens.length,
                itemBuilder: (context, index) {
                  return onboardingScreens[index];
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // color: Color(0xff647a5a),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: goToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xff647a5a),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      _currentPageIndex == onboardingScreens.length - 1
                          ? "Get Started"
                          : "Next",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: skipOnboarding,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          Colors.transparent, // Ensure transparent background
                    ),
                    child: Text(
                      "Skip now",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
