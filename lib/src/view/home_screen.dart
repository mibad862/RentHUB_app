import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rental_app/src/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: _screenWidth * 0.040),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.005, vertical: _screenHeight * 0.020),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Welcome\nMuhammad Ebad', style: TextStyle(color: Colors.black, fontSize: 25.0)),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
                _buildTextField(),
                SizedBox(
                  height: _screenHeight * 0.018,
                ),
                _buildCarouselSlider(cItems),
                SizedBox(
                  height: _screenHeight * 0.015,
                ),
                _buildCard(),
                SizedBox(
                  height: _screenHeight * 0.015,
                ),
                _buildColumn(),
                SizedBox(
                  height: _screenHeight * 0.015,
                ),
                _buildAllItems(),
                SizedBox(
                  height: _screenHeight * 0.015,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildAllItems() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Items",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
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

  Column _buildColumn() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Browse Categories",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2.5),
                      width: 120,
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

  Card _buildCard() {
    return Card(
      color: Colors.grey.shade100,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Want to rent something?'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkLightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                )
              ),
              onPressed: () {},
              child: Text("Add Post"),
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
        // Customize the height of the carousel
        autoPlay: true,
        // Enable auto-play
        enlargeCenterPage: true,
        // Increase the size of the center item
        enableInfiniteScroll: true,
        // Enable infinite scroll
        onPageChanged: (index, reason) {
          // Optional callback when the page changes
          // You can use it to update any additional UI components
        },
      ),
    );
  }
}
