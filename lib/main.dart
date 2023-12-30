import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: 
     UserDetailsForm(),
    );
  }
}

class UserDetailsForm extends StatefulWidget {
  @override
  _UserDetailsFormState createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Sign In'),
        backgroundColor: Color.fromARGB(255, 13, 110, 212)
 
         
        
      ),
      body:Center(child: Container(
        
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(labelText: 'Roll No'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsPage(
                      name: nameController.text,
                      email: emailController.text,
                      rollNo: rollNoController.text,
                      phoneNumber: phoneNumberController.text,
                    ),
                  ),
                );
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    ));
  }
}

class UserDetailsPage extends StatelessWidget {
  final String name;
  final String email;
  final String rollNo;
  final String phoneNumber;

  UserDetailsPage({
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Credential'),
        backgroundColor: Color.fromARGB(255, 221, 54, 8),
        actions: [

          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await showLogoutDialog(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: 
            NetworkImage('http://m.gettywallpapers.com/wp-content/uploads/2023/05/Cool-Anime-Pfp.jpg'),
          ),),
            SizedBox( height:20),
            Text('Name: $name',style: TextStyle(height: 5, fontSize: 20),),
            Text('Email: $email',style: TextStyle(height: 5, fontSize: 20),),
            Text('Roll No: $rollNo',style: TextStyle(height: 5, fontSize: 20),),
            Text('Phone Number: $phoneNumber',style: TextStyle(height: 5, fontSize: 20),),
           IconButton(icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await showLogoutDialog(context);
              Navigator.pop(context);
            },)
          ],
        ),
      ),
    ));
  }


  Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('User $name logged out.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
