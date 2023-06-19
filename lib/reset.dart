import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void resetPassword() {
    // Code to handle password reset logic
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (newPassword == confirmPassword) {
      // Perform password reset operation here
      print('Password reset successful');
    } else {
      // Display an error message for password mismatch
      print('Passwords do not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191970),
      appBar: AppBar(
        backgroundColor: const Color(0xff191970),
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your new password:',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: newPasswordController,
              style: const TextStyle(
                color: Colors.white,
              ), // Set the text color to white
              decoration: const InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'New Password',
                labelStyle: TextStyle(
                  color: Colors.black,
                ), // Set the label text color to white
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black, // Set the border color to white
                  ),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: confirmPasswordController,
              style: const TextStyle(
                color: Colors.white,
              ), // Set the text color to white
              decoration: const InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: Colors.black,
                ), // Set the label text color to white
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Set the border color to white
                  ),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: resetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  primary: Colors.black, // Set the text color to black
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.black, // Set the text color to black
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
