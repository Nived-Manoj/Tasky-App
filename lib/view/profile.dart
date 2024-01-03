import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
