import 'package:bloodwave/register.dart';
import 'package:flutter/material.dart';
import 'package:bloodwave/navigate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  fontWeight: FontWeight.w700),
            ),
          ),
          SingleChildScrollView(
              child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: "Email",
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
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
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              )),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white70,
                            child: IconButton(
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(
                                                title: 'Blood Wave',
                                              )));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyRegister()));
                            },
                            style: const ButtonStyle(),
                            child: const Text(
                              'Sign up',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 20,
                                  color: Colors.white70),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white70,
                                  fontSize: 20,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
