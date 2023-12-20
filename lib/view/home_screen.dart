import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: CircleAvatar(
              radius: 10,
            ),
            toolbarHeight: 300,
            backgroundColor: Color(0xFFFF3A44),
            floating: false,
            pinned: false,
          ),
        ],
      ),
    );
  }
}
