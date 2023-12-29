import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/icons/Group(1).png',
          color: ColorConstant.Black,
        ),
      ),
    );
  }
}
