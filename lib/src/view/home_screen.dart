import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/model/categories_model.dart';
import 'package:rental_app/src/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<Widget> cItems = [
      Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(240, 4, 143, 156),
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 139, 96, 110),
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.005,
                  vertical: screenHeight * 0.020),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome\${home}',
                      style: TextStyle(color: Colors.black, fontSize: 25.0)),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
            _buildTextField(),
            SizedBox(
              height: screenHeight * 0.018,
            ),
            _buildCarouselSlider(cItems),
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All Items",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "See all",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.004,
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
        const Text(
          "Browse Categories",
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: height * 0.002,
        ),
        SizedBox(
          height: height * 0.140,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 2),
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
                  // margin: EdgeInsets.only(top: 4.0, bottom: 4.0, right: width * 0.016),
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: width * 0.15,
                        category.categoryImage,
                        // fit: BoxFit.cover,
                      ),
                      Text(category.categoryName, textAlign: TextAlign.center),
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

  TextField _buildTextField() {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search any item..",
          hintStyle: const TextStyle(fontSize: 18.0),
          prefixIcon: const Icon(
            Icons.search,
            size: 26,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
          )),
    );
  }

  CarouselSlider _buildCarouselSlider(List<Widget> cItems) {
    return CarouselSlider(
      items: cItems,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {},
      ),
    );
  }
}
