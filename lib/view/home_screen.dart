import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            'assets/icons/Group (1).png',
          ),
          onTap: () {},
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              child: CircleAvatar(
                backgroundColor: ColorConstant.Black,
                radius: 25,
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
