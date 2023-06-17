//import 'package:bloodwave/home1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

import 'package:email_validator/email_validator.dart';

//import 'mainpage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final dateFormat = DateFormat('yyyy-MM-dd');

  String? selectedBloodGroup = 'A+';
  String? selectedGender = 'Male';

  Future<void> saveUserData() async {
    final name = nameController.text;
    final phoneNumber = phoneNumberController.text;
    final dateOfBirth = dateOfBirthController.text;
    final gender = selectedGender;
    final email = emailController.text;

    try {
      await firestore.collection('users').add({
        'name': name,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'blood_group': selectedBloodGroup,
        'email': email,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('User data saved successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to save user data.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 206, 209),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || !EmailValidator.validate(value)) {
                  return 'Please enter a valid email.';
                }
                return null;
              },
            ),
            DateTimeField(
              controller: dateOfBirthController,
              format: dateFormat,
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
              },
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
              decoration: const InputDecoration(labelText: 'Blood Group'),
              validator: (value) {
                if (value == null) {
                  return 'Please select a blood group.';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: 'Others',
                  child: Text('Others'),
                ),
              ],
              decoration: const InputDecoration(labelText: 'Gender'),
              validator: (value) {
                if (value == null) {
                  return 'Please select a gender.';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: saveUserData,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff191970),
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
