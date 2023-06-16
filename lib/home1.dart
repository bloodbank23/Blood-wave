import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key});

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? selectedBloodGroup;
  late QuerySnapshot _userSnapshot;
  List<DocumentSnapshot> _filteredUsers = [];
  List<int> selectedUsers = [];
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    final QuerySnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      _userSnapshot = userSnapshot;
      _filteredUsers = userSnapshot.docs;
    });
  }

  void filterUsers(String bloodGroup) {
    List<DocumentSnapshot> filteredUsers = [];
    if (bloodGroup.isNotEmpty) {
      _userSnapshot.docs.forEach((document) {
        final userData = document.data() as Map<String, dynamic>;
        if (userData.containsValue(bloodGroup)) {
          filteredUsers.add(document);
        }
      });
    } else {
      filteredUsers = _userSnapshot.docs;
    }

    setState(() {
      _filteredUsers = filteredUsers;
      selectedUsers.clear(); // Clear selected users when filtering
      selectAll = false; // Reset select all button
    });
  }

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      if (selectAll) {
        selectedUsers = List.generate(_filteredUsers.length, (index) => index);
      } else {
        selectedUsers.clear();
      }
    });
  }

  void deleteSelectedUsers() {
    // Example code for deleting the selected users
    for (int index in selectedUsers) {
      final userId = _filteredUsers[index].id;

      // Delete the user using the user ID
      FirebaseFirestore.instance.collection('users').doc(userId).delete();
    }

    // Clear the selected users list after deletion
    selectedUsers.clear();
  }

  void sendEmails() async {
    final username =
        'mariajojo846@gmail.com'; // Replace with your email address
    final password = '@Mar1a23'; // Replace with your email password

    final smtpServer = gmail(username, password);

    for (int index in selectedUsers) {
      final userData = _filteredUsers[index].data() as Map<String, dynamic>;
      final email = userData['email'] as String?;

      final message = Message()
        ..from = Address(username, 'Your Name')
        ..recipients.add(email!)
        ..subject = 'Your Subject'
        ..text = 'Your Email Body';

      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent: ${sendReport.toString()}');
      } catch (e) {
        print('Error occurred while sending email: $e');
      }
    }
  }

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
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: selectedBloodGroup,
                onChanged: (value) {
                  setState(() {
                    selectedBloodGroup = value;
                    filterUsers(value!);
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
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _filteredUsers.length,
                  itemBuilder: (ctx, index) {
                    final userData =
                        _filteredUsers[index].data() as Map<String, dynamic>?;
                    if (userData != null) {
                      final name = userData['name'] as String?;
                      final phoneNumber = userData['phoneNumber'] as String?;
                      final bloodGroup = userData['blood_group'] as String?;
                      final email = userData['email'] as String?;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: selectedUsers.contains(index),
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  selectedUsers.add(index);
                                } else {
                                  selectedUsers.remove(index);
                                }
                              });
                            },
                          ),
                          title: Text('Name: $name'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone Number: $phoneNumber'),
                              Text('Blood Group: $bloodGroup'),
                              Text('Email: $email'),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: toggleSelectAll,
              backgroundColor: const Color(0xff191970),
              child: Icon(
                  selectAll ? Icons.check_box : Icons.check_box_outline_blank),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: sendEmails,
              backgroundColor: const Color(0xff191970),
              child: const Icon(Icons.email),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: deleteSelectedUsers,
              child: const Icon(Icons.delete),
              backgroundColor: const Color(0xff191970),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
