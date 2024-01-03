import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: ColorConstant.mainbg,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: ColorConstant.Black,
                ),
              ),
              Text(
                "Search",
                style: TextStyle(color: ColorConstant.Black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, Index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstant.mainbg,
                ),
                width: 100,
                height: 100,
              ),
            );
          }),
    );
  }
}
