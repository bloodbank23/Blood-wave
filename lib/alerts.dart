// ALERTS

import 'package:flutter/material.dart';

class SMSPage extends StatefulWidget {
  const SMSPage({super.key});
  @override
  State<SMSPage> createState() => _SMSPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _phoneNumberController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

class _SMSPageState extends State<SMSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send SMS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Press Me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
