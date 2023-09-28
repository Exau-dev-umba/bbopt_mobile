import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:bbopt_mobile/utils/widget/Chargement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/AuthenticationController.dart';
import '../../utils/Message.dart';
import 'package:bbopt_mobile/utils/Constantes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.restorationId,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.validator,
    this.passwordController,
  });

  final String? restorationId;
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final passwordController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> with RestorationMixin {
  final RestorableBool _obscureText = RestorableBool(true);

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_obscureText, 'obscure_text');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      restorationId: 'password_text_field',
      controller: widget.passwordController,
      obscureText: _obscureText.value,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: Colors.white70,
            fontSize: 20
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white70
            )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white70),
        ),
        helperText: widget.helperText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText.value = !_obscureText.value;
            });
          },
          hoverColor: Colors.transparent,
          icon: Icon(
            _obscureText.value ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
      ),
      style: TextStyle(
        color: Constantes.Colorwhite,
        fontSize: 20,
      ),
      cursorColor: Constantes.Colorwhite,
    );

  }
}

class _LoginPageState extends State<LoginPage> {

  bool isVisible = false;

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
    // if (!value.contains('@')) {
    //   return 'Please enter a valid email';
    // }
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
  void login() async{
    isVisible = true;
    FocusScope.of(context).requestFocus(new FocusNode());
    // Validate the form inputs
    if (formKey.currentState!.validate()) {
      // Get the email and password values
      String email = emailController.text;
      String password = passwordController.text;

      // TODO: Implement your login logic here

      setState(() {});
      var ctrl = context.read<AuthenticationController>();
      Map data = {
        "identifier": email,
        "password": password
      };
      print(data);
      var res = await ctrl.login(data);

      await Future.delayed(Duration(seconds: 1));
      isVisible = false;
      setState(() {});
      if (res.status) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {});
        Navigator.popAndPushNamed(context, Routes.homeRoute);
      } else {
        var msg =
        res.isException == true ? res.errorMsg : (res.data?['message']);
        passwordController.clear();
        Message.afficherSnack(context, msg);

      }
      return;
    }
    return;
  }

  @override
  Widget build(BuildContext context) {

    // ObscureText
    bool _obscureText = true;
    return Scaffold(
      body: Stack(
        children: [
          // The background image widget
          Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.green.shade900.withOpacity(0.6),
            ),
            child: Image.asset(
              'images/3.jpg', // The path to your background image
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child :  Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                'BIENVENUE',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  letterSpacing: 10.2,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
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
                child: Container(
                  color: Colors.black54.withOpacity(0.6),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // The email text field widget
                      Text('Connectez-vous',
                      style: TextStyle(
                        color: Constantes.Colorwhite,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 25.0,),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 20
                          ),
                          fillColor: Constantes.Colorwhite,
                          focusColor: Constantes.Colorwhite,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white70),
                          ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                  Icons.mail,
                                  color: Constantes.Colorwhite
                              ),
                            )
                        ),
                        validator: validateEmail,
                        style: TextStyle(
                          color: Constantes.Colorwhite,
                          fontSize: 20,
                        ),
                        cursorColor: Constantes.Colorwhite,
                      ),
                      SizedBox(height: 15.0),
                      // The password text field widget
                      PasswordField(
                        restorationId: 'password_field',
                        passwordController: passwordController,
                        labelText: 'Mot de passe',
                      ),
                      SizedBox(height: 15.0),
                      // The login button widget
                      ElevatedButton(
                        onPressed: login,
                        child: Text('Se connecter'),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Constantes.ColorvertCitron ),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      TextButton(onPressed: (() => Navigator.popAndPushNamed(context, Routes.registrationpage)),
                          child: Text(
                          'Vous n\'avez pas de compte ?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,

                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Chargement(isVisible)
        ],
      ),
    );
  }
}