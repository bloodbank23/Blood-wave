import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        centerTitle: true,
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                height: 0.5,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                //Action for add button
              },
              child: Container(
                color: Colors.blue,
                child: const Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                //Action for update button
              },
              child: Container(
                color: Colors.blue,
                child: const Text('Update'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                //Action for sms button
              },
              child: Container(
                color: Colors.blue,
                child: const Text('SMS'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              height: 30,
              color: Colors.black,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 183, 255, 68),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(
                          showRegisterPage: () {},
                        ),
                      ));
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
