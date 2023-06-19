import 'package:bloodwave/home.dart';
import 'package:bloodwave/home1.dart';
import 'package:bloodwave/register.dart';
import 'package:bloodwave/reset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodwave/navigate.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required Null Function() showRegisterPage})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> logIn() async {
    try {
      UserCredential cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      Get.to(const HomePage());
    } catch (error) {
      // Handle login error
      print('Login Error: $error');
    }
  }

  void loggedIn() {
    logIn();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage(
                title: 'Blood Wave',
              );
            } else {
              return LoginScreen(
                showRegisterPage: () {},
              );
            }
          },
          //}
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191970),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 150),
            child: Column(
              children: [
                Image.asset(
                  "android/assets/image/logologin.png",
                  width: 330, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                ),
              ],
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
                      child: Column(children: [
                        TextField(
                          controller: _emailController,
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
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: loggedIn,
                              child: ElevatedButton(
                                onPressed: loggedIn,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white70,
                                  disabledBackgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
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
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              'Sign up',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 20,
                                  color: Colors.white70),
                            ),
                          ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPasswordPage(),
                                    ),
                                  );
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
                            ),
                          ],
                        )
                      ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
