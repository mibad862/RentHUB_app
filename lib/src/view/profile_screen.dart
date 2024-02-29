import 'package:flutter/material.dart';
import 'package:rental_app/src/model/profile_model.dart';
import 'package:rental_app/src/utils/colors.dart';
import '../utils/textstyles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('Profile', style: style2),
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
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -1),
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 3.0,
                        leading: Icon(
                          profile.itemIconData,
                          size: 30.0,
                        ),
                        title: Text(
                          profile.itemName,
                          style: style1,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
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
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 18,),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.020),
                Text(
                  'Muhammad Ebad Ur Rehman',
                  style: style2,
                ),
              ],
            ),
          );
  }
}
