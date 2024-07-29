import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neat_test_app/providers/auth_provider.dart'; // Replace with your actual provider import

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController(); // Updated controller
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      width: 120,
                      image: AssetImage("assets/icons/appicon2.png"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: 'Username',
                      hintText: 'Enter Username',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(height: 32),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    final username = _usernameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final confirmPassword = _confirmPasswordController.text;

                    if (password != confirmPassword) {
                      setState(() {
                        _errorMessage = "Passwords do not match.";
                      });
                      return;
                    }

                    try {
                      await context.read<AuthProvider>().signUp(
                          username, email, password); // Updated signUp method
                      Navigator.pushReplacementNamed(context, '/home');
                    } catch (e) {
                      setState(() {
                        _errorMessage = e.toString();
                      });
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff647a5a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text("OR"),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacementNamed(context, '/sign-in');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: 30,
                            image: AssetImage("assets/images/google-logo.png"),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/sign-in');
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
