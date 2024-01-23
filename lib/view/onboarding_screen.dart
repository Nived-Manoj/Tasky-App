import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/student1.png"),
          Text("Manage your daily activity  team with tasky"),
          ElevatedButton(onPressed: () {}, child: Text("Get Started")),
        ],
      ),
    );
  }
}
