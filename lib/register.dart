import 'package:bloodwave/login_screen.dart';
import 'package:bloodwave/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodwave/navigate.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key, required void Function() showLoginPage});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bloodController = TextEditingController();
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  void pointTo() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
                  showRegisterPage: () {},
                )));
  }

  Future<void> signUp() async {
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String fullname = _nameController.text.trim();
      String bloodgroup = _bloodController.text.trim();
      String mobilenumber = _mobileController.text.trim();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user?.email)
          .set({
        'name': fullname,
        'blood': bloodgroup,
        'mobile': mobilenumber,
        'email': email,
        'password': password
      });
      reg = 'success';
    } catch (error) {
      reg = 'not success';
      print('Login Error: $error');
    }
  }

  String reg = 'not success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff191970),
      body: Stack(
        children: [
          Container(),
          Container(
            padding: const EdgeInsets.only(left: 35, top: 150),
            child: const Text(
              'Create Account !',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 33,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SingleChildScrollView(
              child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: "Full Name",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _bloodController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: "Blood Group",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _mobileController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: "Mobile",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: "Email",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _passwordController,
                        style: const TextStyle(),
                        obscureText: true,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white70),
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
                                Navigator.pushNamed(context, 'login');
                              },
                              child: const Text(
                                'Sign Up',
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
                                  signUp();
                                  if (reg == 'success') {
                                    return pointTo();
                                  }
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
