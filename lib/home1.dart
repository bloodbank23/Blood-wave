import 'package:flutter/material.dart';

void main() {
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  get body => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff191970),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search for person details.",
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff191970)),
                      child: const Text('A+'),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191970)),
                        child: const Text('B+')),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191970)),
                        child: const Text('A-')),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191970)),
                        child: const Text('B-')),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff191970)),
                      child: const Text('O+'),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191970)),
                        child: const Text('O-')),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191970)),
                        child: const Text('AB+')),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff191970)),
                        child: const Text('AB-')),
                  ],
                ),
              ],
            )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
