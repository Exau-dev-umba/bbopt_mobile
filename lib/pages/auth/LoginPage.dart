import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // A controller for the email text field
  final emailController = TextEditingController();

  // A controller for the password text field
  final passwordController = TextEditingController();

  // A key for the form widget
  final formKey = GlobalKey<FormState>();

  // A method to validate the email input
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // A method to validate the password input
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // A method to handle the login button press
  void login() {
    // Validate the form inputs
    if (formKey.currentState!.validate()) {
      // Get the email and password values
      String email = emailController.text;
      String password = passwordController.text;

      // TODO: Implement your login logic here

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful'),
        ),
      );
      //Naigate to home page
      Navigator.popAndPushNamed(context, Routes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The background image widget
          Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.black54
            ),
            child: Image.asset(
              'images/3.jpg', // The path to your background image
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          // The logo widget
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.asset(
                'images/4.png',// The path to your logo image
                height: 300.0,
                width: 300.0,
              ),
            ),
          ),
          // The form widget
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // The email text field widget
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: validateEmail,
                    ),
                    SizedBox(height: 10.0),
                    // The password text field widget
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true, // Hide the password input
                      validator: validatePassword,
                    ),
                    SizedBox(height: 10.0),
                    // The login button widget
                    ElevatedButton(
                      onPressed: login,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}