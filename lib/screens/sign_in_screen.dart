import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neat_test_app/providers/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                      "Welcome Back",
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
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 28),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    try {
                      await context
                          .read<AuthProvider>()
                          .signIn(username, password);
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
                        "Login",
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
                    // Navigator.pushNamed(context, '/sign-up');
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
                    Text("Don't have an account?"),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      child: Text(
                        "Sign Up",
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
