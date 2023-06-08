import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental/colors/colors.dart';

import 'login.dart';
// import 'model.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Tenant',
    'Renter',
  ];
  var _currentItemSelected = "Tenant";
  var rool = "Tenant";

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
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
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
                                'Sign Up',
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
                        const SizedBox(
                          height: 25,
                        ),
                        _nameTextField(),
                        const SizedBox(
                          height: 25,
                        ),
                        _contactTextfield(),
                        const SizedBox(
                          height: 20,
                        ),
                        _emailTextfield(),
                        const SizedBox(
                          height: 20,
                        ),
                        _passwordTextfield(),
                        const SizedBox(
                          height: 20,
                        ),
                        _confirmPassword(),
                        const SizedBox(
                          height: 25,
                        ),
                        _dropdownButton(),
                        const SizedBox(
                          height: 41,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _registerButton(),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text('Already Have an account?',
                                style: TextStyle(
                                    color: tdBlack,
                                    fontFamily: 'JetBrainsMono')),
                            const SizedBox(
                              height: 25,
                            ),
                            _loginButton(context),
                          ],
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

  MaterialButton _loginButton(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 40,
      minWidth: MediaQuery.of(context).size.width * 0.4,
      onPressed: () {
        CircularProgressIndicator();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      color: tdpurple2,
      child: const Text(
        "Login",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'JetBrainsMono',
        ),
      ),
    );
  }

  MaterialButton _registerButton() {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 40,
      minWidth: double.infinity,
      onPressed: () {
        setState(() {
          showProgress = true;
        });
        signUp(
          emailController.text,
          passwordController.text,
          rool,
          name.text,
          mobile.text,
        );
      },
      color: tdpurple2,
      child: const Text(
        "Register",
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'JetBrainsMono',
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

  TextFormField _nameTextField() {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Name',
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
        if (value == null || value.isEmpty) {
          return 'Please enter username';
        } else if (value.length < 4) {
          return 'at least enter 4 characters';
        } else if (value.length >= 25) {
          return 'maximum character is 25';
        }
        return null;
      },
    );
  }

  TextFormField _contactTextfield() {
    return TextFormField(
      controller: mobile,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Phone number',
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
        RegExp regex = RegExp(r'^\+?\d{9,15}$');
        if (value == null || value.isEmpty) {
          return 'Please enter Contact Details.';
        } else if (!regex.hasMatch(value)) {
          return 'Phone number is not Valid';
        } else if (value.length >= 11) {
          return 'maximum number is 11';
        }
        return null;
      },
    );
  }

  Padding _dropdownButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: tdpurple3, borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          icon: const Icon(Icons.arrow_drop_down_circle_rounded),
          isExpanded: true,
          elevation: 5,
          underline: null,
          dropdownColor: Colors.grey,
          items: options.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(
                dropDownStringItem,
                style: const TextStyle(
                  fontFamily: 'JetBrainsMono',
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValueSelected) {
            setState(() {
              _currentItemSelected = newValueSelected!;
              rool = newValueSelected;
            });
          },
          value: _currentItemSelected,
        ),
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
      onChanged: (value) {},
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField _confirmPassword() {
    return TextFormField(
      obscureText: _isObscure2,
      controller: confirmpassController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(_isObscure2 ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure2 = !_isObscure2;
              });
            }),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Confirm Password',
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
        if (confirmpassController.text != passwordController.text) {
          return "Password did not match";
        } else {
          return null;
        }
      },
      onChanged: (value) {},
    );
  }

  TextFormField _passwordTextfield() {
    return TextFormField(
      obscureText: _isObscure,
      controller: passwordController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
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
        // RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Please Enter Password";
        } else if (value.length < 6) {
          return ("please enter valid password min. 6 character");
        } else if (value.length > 25) {
          return ("please enter valid password max. 25 character");
        } else {
          return null;
        }
      },
      onChanged: (value) {},
    );
  }

  void signUp(
    String email,
    String password,
    String rool,
    String name,
    String mobile,
  ) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(
                  email,
                  rool,
                  name,
                  mobile,
                )
              })
          .catchError((e) {
        print("Error");
      });
    }
  }

  postDetailsToFirestore(
      String email, String rool, String name, String mobile) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'rool': rool,
      'name': name,
      'number': mobile,
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
