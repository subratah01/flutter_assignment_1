import 'package:flutter/material.dart';

void main() {
  //flutter code for the UI with “AppBar, IconButton, CircleAvatar, Text, Icon” widgets.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(
          size: 100,
          color: Colors.deepPurple.shade900,
        ),
      ),
      themeMode: ThemeMode.system,
      home: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.yellow.shade600,
        actions: [
          IconButton(
              onPressed: () {
                print('Add button pressed');
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                print('Settings button pressed');
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                print('Calling button pressed');
              },
              icon: Icon(Icons.call)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 90,
                backgroundColor: Color.fromRGBO(234, 221, 255, 1),
                child: Icon(Icons.icecream_outlined),
              ),
              Text(
                'Ice cream is very delicious right?',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              CircleAvatar(
                radius: 90,
                //backgroundColor: Colors.purple.shade100,
                backgroundColor: Color.fromRGBO(234, 221, 255, 1),
                child: Icon(Icons.code),
              ),
              Text(
                'Programming is not boring if you love it',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              CircleAvatar(
                radius: 90,
                //backgroundColor: Colors.purple.shade100,
                backgroundColor: Color.fromRGBO(234, 221, 255, 1),
                child: Icon(Icons.egg_outlined),
              ),
              Text(
                'If you submit code directly copy from chatgpt then mark will 0',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
