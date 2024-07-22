import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.white,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            color: ColorConstant.Black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorConstant.Black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _buildProfileHeader()),
              const SizedBox(height: 24),
              Text(
                "Personal Info",
                style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage:
              AssetImage('assets/profile_image.jpg'), // Add your image
        ),
        const SizedBox(height: 16),
        Text(
          "Shane Watson",
          style: TextStyle(
            color: ColorConstant.Black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Flutter Developer",
          style: TextStyle(
            color: ColorConstant.Black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorConstant.mainbg,
      ),
      child: Column(
        children: [
          _buildInfoItem("Email", "shanewatson@gmail.com"),
          _buildInfoItem("Phone", "+14 223 224 553"),
          _buildInfoItem("Birthday", "11/11/1999"),
          _buildInfoItem("Name", "Shane Watson"),
          _buildInfoItem("Location", "New York, USA"),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: ColorConstant.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: ColorConstant.Black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: ColorConstant.grey.withOpacity(0.5)),
        ],
      ),
    );
  }
}
