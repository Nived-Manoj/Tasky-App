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
            expandedHeight: 300,
            backgroundColor: Color(0xFFFF3A44),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('T A S K Y'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
