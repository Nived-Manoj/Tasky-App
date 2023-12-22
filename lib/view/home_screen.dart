import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 40,
              ),
            ),
            expandedHeight: 300,
            backgroundColor: Color(0xFFFF3A44),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(left: 45),
                child: Text('T A S K Y'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              color: Colors.blueAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
