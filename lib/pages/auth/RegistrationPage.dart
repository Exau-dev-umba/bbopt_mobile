import 'package:bbopt_mobile/controllers/AuthenticationController.dart';
import 'package:bbopt_mobile/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/widget/Chargement.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
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
        helperStyle : TextStyle(
          color : Colors.white
        ),
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
        color: Colors.white,
        fontSize: 20,
      ),
      cursorColor: Colors.white,
    );

  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool  isVisible = false;
  // A controller for the name text field
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();

  final paysController = TextEditingController();
  // A controller for the email text field
  final emailController = TextEditingController();

  // A controller for the password text field
  final passwordController = TextEditingController();

  // A controller for the password confrimed text field
  final passwordConfirmedController = TextEditingController();

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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    if (value.length > 100){
      return 'Name must be at most 100  characters long';
    }
    return null;
  }

  // A method to validate the password input
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validatePasswordConfirmed(String? value) {
    if (value != passwordController.text){
      return 'Les mots de passe ne correspondent pas';
    }
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // A method to handle the login button press
  void register() {
    var authCtrl = context.read<AuthenticationController>();
    isVisible = true;
    // Validate the form inputs
    if (formKey.currentState!.validate()) {
      // Get the firstName, lastName, pays, email, password and passwordConfirmed values
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String username = usernameController.text;
      String pays = paysController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String confirmPassword = passwordConfirmedController.text;

      Map data = {
        "name":lastName,
        "firstname":firstName,
        "email":email,
        "username":username,
        "password":password,
        "password_confirmation":confirmPassword,
        "country":pays
      };
      authCtrl.register(data);
      Navigator.pushNamed(context, Routes.homeRoute);
      isVisible =false;
      print("DATA USER REGISTER : ${data}");
      //Naigate to home page
      // Navigator.popAndPushNamed(context, Routes.homeRoute);
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
              color: Colors.green.shade900.withOpacity(0.6),
            ),
            child: Image.asset(
              'images/1.jpg', // The path to your background image
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          // The logo widget
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
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
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      padding:  const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // The email text field widget
                          Text('Créer un compte',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 25.0,),
                          TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                                labelText: 'Prénom',
                                labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20
                                ),
                                fillColor: Colors.white,
                                focusColor: Colors.white,
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
                                      Icons.person,
                                      color: Colors.white
                                  ),
                                )
                            ),
                            validator: validateName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            cursorColor: Colors.white,
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                                labelText: 'Nom',
                                labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20
                                ),
                                fillColor: Colors.white,
                                focusColor: Colors.white,
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
                                      Icons.person,
                                      color: Colors.white
                                  ),
                                )
                            ),
                            validator: validateName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            cursorColor: Colors.white,
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20
                                ),
                                fillColor: Colors.white,
                                focusColor: Colors.white,
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
                                      Icons.person,
                                      color: Colors.white
                                  ),
                                )
                            ),
                            validator: validateName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            cursorColor: Colors.white,
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: paysController,
                            decoration: InputDecoration(
                                labelText: 'Pays',
                                labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20
                                ),
                                fillColor: Colors.white,
                                focusColor: Colors.white,
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
                                      Icons.location_city,
                                      color: Colors.white
                                  ),
                                )
                            ),
                            validator: validateName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            cursorColor: Colors.white,
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20
                                ),
                                fillColor: Colors.white,
                                focusColor: Colors.white,
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
                                      color: Colors.white
                                  ),
                                )
                            ),
                            validator: validateEmail,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            cursorColor: Colors.white,
                          ),
                          SizedBox(height: 15.0),
                          // The password text field widget
                          PasswordField(
                            restorationId: 'password_field',
                            passwordController: passwordController,
                            labelText: 'Mot de passe',
                            validator: validatePassword,
                          ),
                          SizedBox(height: 15.0),

                          PasswordField(
                            restorationId: 'password_field',
                            passwordController: passwordConfirmedController,
                            labelText: 'Confirmer le mot de passe',
                            validator : validatePasswordConfirmed,
                          ),
                          SizedBox(height: 15.0),
                          // The login button widget
                          ElevatedButton(
                            onPressed: register,
                            child: Text('Créer un compte'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green.shade700 ),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          TextButton(
                              onPressed: (() => Navigator.popAndPushNamed(context, Routes.loginpage)),
                              child: Text(
                            'Vous avez déjà un compte ?',
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
            ),
          ),
          Chargement(isVisible)
        ],
      ),
    );
  }
}