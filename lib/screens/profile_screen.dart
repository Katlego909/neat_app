import 'package:flutter/material.dart';
import 'package:neat_test_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.nights_stay_outlined),
            onPressed: () {
              // Add night mode toggle functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/images/avatar.jpg'), // Add your image asset here
                ),
                SizedBox(height: 10),
                Text(
                  'Mia',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'mia@email.com',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                ListTile(
                  leading: Icon(Icons.edit_outlined),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to edit profile screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text('Manage Address'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to manage address screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language_outlined),
                  title: Text('Language'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to language settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to settings screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('Help & FAQ'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to help & FAQ screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock_outline),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to privacy policy screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text('Terms of use'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Add navigation to terms of use screen
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.read<AuthProvider>().signOut();
                    Navigator.pushReplacementNamed(context, '/sign-in');
                  },
                  child: Container(
                    padding: EdgeInsets.all(14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xff007ba7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "LOG OUT",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
