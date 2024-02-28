import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> categoriesList = [
      "Electronics",
      "Furniture",
      "Real-Estate",
      "Auto-Mobile",
      "Tools and Equipments",
    ];

    String? selectedCategory;

    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Include some details'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: _screenWidth * 0.035),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _uploadRow(_screenHeight),
              Container(
                alignment: Alignment.center,
                height: _screenHeight * 0.220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: const Text(
                  'Add Images',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: _screenHeight * 0.022),
              _buildDropdownButtonFormField(selectedCategory, categoriesList),
              SizedBox(height: _screenHeight * 0.018),
              _rentColumn(_screenHeight),
              SizedBox(height: _screenHeight * 0.018),
              _titleColumn(_screenHeight),
              SizedBox(height: _screenHeight * 0.018),
              _buildDescription(_screenHeight),
              SizedBox(height: _screenHeight * 0.018),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildDescription(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Describe about item',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: height * 0.008),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Padding _uploadRow(double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.020),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'UPLOAD THE ITEM PHOTOS',
            style: TextStyle(fontSize: 18.0),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: height * 0.030,
              )),
        ],
      ),
    );
  }

  Column _titleColumn(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Title',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: height * 0.008),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Column _rentColumn(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rent',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: height * 0.008),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: "RS - ",
            suffixText: "/- Month",
            prefixStyle: const TextStyle(color: Colors.black, fontSize: 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  DropdownButtonFormField<String> _buildDropdownButtonFormField(
      String? selectedCategory, List<String> categoriesList) {
    return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(14.0),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        hint: const Text("Select your category"),
        value: selectedCategory,
        items: categoriesList
            .map((e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedCategory = value;
          });
       });
}
}