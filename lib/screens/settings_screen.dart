import 'package:flutter/material.dart';
import 'package:neat_test_app/providers/theme_notifier.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ThemeNotifier>(
          builder: (context, themeNotifier, child) {
            return SwitchListTile(
              title: Text('Dark Mode'),
              value: themeNotifier.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeNotifier
                    .setTheme(value ? ThemeMode.dark : ThemeMode.light);
              },
            );
          },
        ),
      ),
    );
  }
}
