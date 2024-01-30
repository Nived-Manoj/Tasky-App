import 'package:flutter/material.dart';
import 'package:mainproject_tasky/view/login_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/student1.png"),
          Text("Manage your daily activity  team with tasky"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text("Get Started")),
        ],
      ),
    );
  }
}
