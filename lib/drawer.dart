import 'package:bloodwave/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({super.key});

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff191970)),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff191970)),
                accountName: Text(
                  "Coral Isle Hospital",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("coralislehospital@gmail.com"),
              )),
          const ListTile(
            leading: Icon(Icons.edit),
            title: Text(' Edit Profile '),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(
                    showRegisterPage: () {},
                  ),
                ),
              );
            },
            title: const Text('LogOut'),
          ),
        ],
      ),
    );
  }
}
