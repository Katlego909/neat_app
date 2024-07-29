import 'package:flutter/material.dart';
import 'package:neat_test_app/providers/auth_provider.dart';
import 'package:neat_test_app/providers/booking_provider.dart';
import 'package:neat_test_app/providers/service_provider.dart';
import 'package:neat_test_app/providers/theme_notifier.dart';
import 'package:neat_test_app/screens/main_screen.dart';
import 'package:neat_test_app/screens/settings_screen.dart';
import 'package:neat_test_app/widgets/onboarding_flow.dart';
import 'package:neat_test_app/screens/sign_in_screen.dart';
import 'package:neat_test_app/screens/sign_up_screen.dart';
import 'package:neat_test_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceProviderProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
        ChangeNotifierProvider(
            create: (_) => AuthProvider()..checkLoginStatus()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Neat Home Services',
            theme: _lightTheme(),
            darkTheme: _darkTheme(),
            themeMode: themeNotifier.themeMode,
            home: Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                return _getHomeWidget(authProvider);
              },
            ),
            routes: {
              '/sign-up': (context) => SignUpScreen(),
              '/sign-in': (context) => SignInScreen(),
              '/home': (context) => MainScreen(),
              '/settings': (context) => SettingsScreen(),
            },
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/sign-up':
                  return MaterialPageRoute(
                      builder: (context) => SignUpScreen());
                case '/sign-in':
                  return MaterialPageRoute(
                      builder: (context) => SignInScreen());
                case '/home':
                  return MaterialPageRoute(builder: (context) => MainScreen());
                default:
                  return MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('404 - Not Found'),
                      ),
                      body: Center(
                        child: Text('Page not found'),
                      ),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Color(0xffbfc3b4),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Color(0xff303030),
    );
  }

  Widget _getHomeWidget(AuthProvider authProvider) {
    if (authProvider.isChecking) {
      return SplashScreen();
    } else if (authProvider.isLoggedIn) {
      return MainScreen();
    } else {
      return authProvider.hasCompletedOnboarding
          ? SignInScreen()
          : OnboardingFlow();
    }
  }
}
