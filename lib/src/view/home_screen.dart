import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/model/categories_model.dart';
import 'package:rental_app/src/utils/colors.dart';
import 'package:rental_app/src/utils/textstyles.dart';
import 'package:rental_app/src/widgets/common_streambuilder.dart';

import '../model/carousel_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    User? currentUser = FirebaseAuth.instance.currentUser;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.005,
                right: screenWidth * 0.005,
                bottom: screenHeight * 0.020,
                top: screenHeight * 0.022,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome,', style: TextStyle(fontSize: 24)),
                      CommonStreamBuilder(),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.002,
            ),
            _buildCarouselSlider(),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            _buildCard(screenHeight, screenWidth, context),
            SizedBox(
              height: screenHeight * 0.018,
            ),
            _categoriesColumn(screenHeight, screenWidth),
            SizedBox(
              height: screenHeight * 0.018,
            ),
            _buildAllItems(screenHeight, screenWidth),
            SizedBox(
              height: screenHeight * 0.015,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildAllItems(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All Items",
              style: style4,
            ),
            const Text(
              "See all",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.005,
        ),
        SizedBox(
          height: height * 0.150,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: width * 0.012),
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.green,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                    )),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _categoriesColumn(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Browse Categories",
          style: style4,
        ),
        SizedBox(
          height: height * 0.002,
        ),
        SizedBox(
          height: height * 0.150,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            scrollDirection: Axis.horizontal,
            itemCount: CategoriesModel.categoriesList.length,
            itemBuilder: (context, index) {
              final category = CategoriesModel.categoriesList[index];

              return SizedBox(
                width: width * 0.340,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: width * 0.15,
                        category.categoryImage,
                      ),
                      Text(
                        category.categoryName,
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.1,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Card _buildCard(double height, double width, BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.030),
        width: double.infinity,
        height: height * 0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Want to rent something?'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkLightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
              onPressed: () => Navigator.pushNamed(context, '/addpost'),
              child: const Text("Add Post"),
            )
          ],
        ),
      ),
    );
  }

  CarouselSlider _buildCarouselSlider() {
    return CarouselSlider(
      items: cItems,
      options: CarouselOptions(
        viewportFraction: 0.98,
        height: 180,
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {},
      ),
    );
  }
}
