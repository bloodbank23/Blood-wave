import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key});

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? selectedBloodGroup;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Search for a blood group!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: selectedBloodGroup,
                onChanged: (value) {
                  setState(() {
                    selectedBloodGroup = value;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 'A+',
                    child: Text('A+'),
                  ),
                  DropdownMenuItem(
                    value: 'A-',
                    child: Text('A-'),
                  ),
                  DropdownMenuItem(
                    value: 'B+',
                    child: Text('B+'),
                  ),
                  DropdownMenuItem(
                    value: 'B-',
                    child: Text('B-'),
                  ),
                  DropdownMenuItem(
                    value: 'AB+',
                    child: Text('AB+'),
                  ),
                  DropdownMenuItem(
                    value: 'AB-',
                    child: Text('AB-'),
                  ),
                  DropdownMenuItem(
                    value: 'O+',
                    child: Text('O+'),
                  ),
                  DropdownMenuItem(
                    value: 'O-',
                    child: Text('O-'),
                  ),
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff191970),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Select a blood group",
                  hintStyle: const TextStyle(color: Colors.white),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a blood group.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
