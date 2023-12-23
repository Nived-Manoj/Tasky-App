import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(
                    width: 300,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              )
            ],
            stretch: true,
            toolbarHeight: 100,
            expandedHeight: 300,
            backgroundColor: Color(0xFFFF3A44),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              title: Padding(
                padding: EdgeInsets.only(left: 50),
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
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              color: Colors.blueAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
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
