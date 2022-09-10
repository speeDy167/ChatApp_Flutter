
import 'package:chatapp/service/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helper/helper_function.dart';
import '../pages/home_page.dart';
import '../widgets/reuse_widgets.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _fullName = "";
  bool _isLoading = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'ChatNow',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Sign Up now to see what they're talking.",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Image.asset('assets/images/register.png'),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Full Name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              setState(() {
                                _fullName = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else
                                return "Please enter your name.";
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                                print(_email);
                              });
                            },
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : "Please enter a valid Email.";
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: Colors.black,
                              ),
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                                print(_password);
                              });
                            },
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Password must be at least 6 characters.";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: signInButton('Sign Up', register)),
                          RichText(
                            text: TextSpan(
                              text: "Already have an account?",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " Login here",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      nextScreen(context, const LoginPage());
                                    },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(_fullName, _email, _password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(_email);
          await HelperFunctions.saveUserNameSF(_fullName);
          nextScreen(context, const HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
