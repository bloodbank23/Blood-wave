import 'package:bloodwave/home.dart';
import 'package:bloodwave/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodwave/navigate.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({Key? key, required this.showRegisterPage})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  String email = "";
  String password = "";
  String name = "";
  String mobile = "";
  String bloodGroup = "";

  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to the desired page after successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(
            title: 'Blood Wave',
          ),
        ),
      );
    } catch (error) {
      // Handle login error
      print('Login Error: $error');
    }
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Save additional user information to the database (e.g., Firestore)
      // You can use the user's UID as the document ID
      final user = FirebaseAuth.instance.currentUser;
      final userData = {
        'name': name,
        'email': email,
        'mobile': mobile,
        'bloodGroup': bloodGroup,
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .set(userData);

      // Navigate to the desired page after successful signup
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(
            title: 'Blood Wave',
          ),
        ),
      );
    } catch (error) {
      // Handle signup error
      print('Signup Error: $error');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _bloodGroupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191970),
      body: Stack(
        children: [
          Container(),
          Container(
            padding: const EdgeInsets.only(left: 35, top: 150),
            child: const Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 33,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          onChanged: (value) => setState(() => email = value),
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: "Email",
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _passwordController,
                          style: const TextStyle(),
                          onChanged: (value) =>
                              setState(() => password = value),
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: "Password",
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _nameController,
                          onChanged: (value) => setState(() => name = value),
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: "Name",
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _mobileController,
                          onChanged: (value) => setState(() => mobile = value),
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: "Mobile",
                            prefixIcon:
                                const Icon(Icons.phone, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _bloodGroupController,
                          onChanged: (value) =>
                              setState(() => bloodGroup = value),
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: "Blood Group",
                            prefixIcon:
                                const Icon(Icons.favorite, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: logIn,
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                color: Colors.black,
                                onPressed: signUp,
                                icon: const Icon(
                                  Icons.arrow_forward,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyRegister(
                                        showLoginPage: () {},
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: const Text(
                                  'Sign up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                      color: Colors.white70),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white70,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
