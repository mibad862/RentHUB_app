import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/model/profile_model.dart';
import 'package:rental_app/src/utils/colors.dart';
import 'package:rental_app/src/widgets/common_button.dart';
import 'package:rental_app/src/widgets/common_streambuilder.dart';
import '../utils/textstyles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showLogoutDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: const Text("Logout"),
            content: const Text("Are you sure you want to logout?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xFF0F52BA)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F52BA),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.color5,
      appBar: AppBar(
        // iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: AppColors.color5,
        centerTitle: true,
        title: Text('Profile', style: style7),
        actions: [
          IconButton(
            onPressed: showLogoutDialog,
            icon: const Icon(
              Icons.logout,
              color: AppColors.appBackgroundColor,
              size: 28.0,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.050),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAlign(screenHeight, style2),
            SizedBox(height: screenHeight * 0.020),
            _buildExpanded(),
            SizedBox(height: screenHeight * 0.010),
          ],
        ),
      ),
    );
  }

  Widget _buildExpanded() {
    return Expanded(
      child: ListView.builder(
          itemCount: ProfileModel.profileItemList.length,
          itemBuilder: (context, index) {
            final profile = ProfileModel.profileItemList[index];
            return Column(
              children: [
                ListTile(
                  onTap: () {},
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -1),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 3.0,
                  leading: Icon(
                    profile.itemIconData,
                    size: 30.0,
                    color: AppColors.darkLightBlue,
                  ),
                  title: Text(
                    profile.itemName,
                    style: style1,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkLightBlue,
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            );
          }),
    );
  }

  Widget _buildAlign(double screenHeight, TextStyle style2) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 55,
              ),
              Positioned(
                bottom: 0.0,
                right: 5.0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.020),
          const CommonStreamBuilder(),
        ],
      ),
    );
  }
}
