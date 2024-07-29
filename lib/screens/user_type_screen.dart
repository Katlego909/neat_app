import 'package:flutter/material.dart';

class UserTypeScreen extends StatefulWidget {
  @override
  _UserTypeScreenState createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  String _selectedAccountType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7D8C5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/appicon2.png', // Place your logo image in the assets folder
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20.0),
              Text(
                'Choose Account Type',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: AccountTypeCard(
                      icon: Icons.person,
                      label: 'User/Client',
                      isSelected: _selectedAccountType == 'User/Client',
                      onTap: () {
                        setState(() {
                          _selectedAccountType = 'User/Client';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: AccountTypeCard(
                      icon: Icons.cleaning_services,
                      label: 'Service Provider',
                      isSelected: _selectedAccountType == 'Service Provider',
                      onTap: () {
                        setState(() {
                          _selectedAccountType = 'Service Provider';
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle continue button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4E694E),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AccountTypeCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: isSelected
              ? Border.all(color: Color(0xFF4E694E), width: 3.0)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.black,
            ),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
