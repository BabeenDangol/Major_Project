import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental/Components/TenantNavBar/bottomnav_login.dart';

import 'package:rental/colors/colors.dart';

import 'package:rental/utils/route_names.dart';

import '../renter/renter_view.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: tdBGColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  //Login Form
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        //Heading Part
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.person_2,
                              color: tdBlack,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'JetBrainsMono',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Entering Email
                        const SizedBox(
                          height: 25,
                        ),
                        _emailTextfield(),
                        //Entering Password
                        const SizedBox(
                          height: 30,
                        ),
                        _passwordTextfield(),
                        //login button
                        const SizedBox(
                          height: 40,
                        ),
                        _loginButton(),
                        //Need an Account container
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Text(
                            'Need an account?',
                            style: TextStyle(
                              color: tdBlack,
                              fontFamily: 'JetBrainsMono',
                            ),
                          ),
                        ),
                        //Signup Button
                        const SizedBox(
                          height: 25,
                        ),

                        _signupButton(context),

                        const SizedBox(
                          height: 25,
                        ),
                        LineWidget(lineLength: 182),
                        const SizedBox(
                          height: 25,
                        ),
                        //Forgot Password  Widget
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Align(alignment: Alignment.center),
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: tdBlack,
                                  fontFamily: 'JetBrainsMono',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: tdpurple2,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Rental',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }

  TextFormField _emailTextfield() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Email',
        hintStyle: TextStyle(fontFamily: 'JetBrainsMono'),
        enabled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        if (value!.length == 0) {
          return "Email cannot be empty";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField _passwordTextfield() {
    return TextFormField(
      controller: passwordController,
      obscureText: _isObscure3,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon:
                Icon(_isObscure3 ? Icons.visibility_off : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure3 = !_isObscure3;
              });
            }),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
        hintStyle: TextStyle(fontFamily: 'JetBrainsMono'),
        enabled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Password cannot be empty";
        }
        if (!regex.hasMatch(value)) {
          return ("please enter valid password min. 6 character");
        } else {
          return null;
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  MaterialButton _loginButton() {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 5.0,
      height: 60,
      minWidth: double.infinity,
      onPressed: () {
        setState(() {
          visible = true;
        });
        signIn(emailController.text, passwordController.text);
      },
      color: tdpurple2,
      child: const Text(
        "Login",
        style: TextStyle(
            color: tdBGColor, fontSize: 20, fontFamily: 'JetBrainsMono'),
      ),
    );
  }

  MaterialButton _signupButton(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 5.0,
      height: 40,
      minWidth: MediaQuery.of(context).size.width * 0.4,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Register(),
            ));
      },
      color: tdpurple,
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'JetBrainsMono',
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Renter") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RenterViewPage(),
            ),
          );
        } else {
          Navigator.pushNamed(
            context,
            RouteName.tenantbottomnav,
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Invalid input"),
              content: const Text(
                  "Please make sure the Email and Password was Correctly entered."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay"))
              ],
            ),
          );
          //print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

class LinePainter extends CustomPainter {
  final double lineLength;

  LinePainter({required this.lineLength});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 70, 65, 65)
      ..strokeWidth = 1;

    final start = (size.width - lineLength) / 2;
    final end = start + lineLength;

    canvas.drawLine(
      Offset(start, size.height / 2),
      Offset(end, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LineWidget extends StatelessWidget {
  final double lineLength;

  LineWidget({required this.lineLength});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(lineLength: lineLength),
      size: Size(double.infinity, 1),
    );
  }
}
