import 'package:flutter/material.dart';
import 'package:rental_app/src/utils/textstyles.dart';

class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({super.key});

  @override
  SearchItemScreenState createState() => SearchItemScreenState();
}

class SearchItemScreenState extends State<SearchItemScreen> {
  List<String> categories = [
    'Electronics',
    'Clothing',
    'Books',
    'Home Decor',
    'Home Decor',
    'Home Decor',
    'Home Decor',
    'Home Decor',
    'Home Decor',
    'Home Decor'
  ];
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredCategories = categories
        .where((category) =>
            searchText.isEmpty ||
            category.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Quick Filters',
            style: style7,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _searchField(),
              _itemsList(filteredCategories),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _itemsList(List<String> filteredCategories) {
    return Expanded(
      child: filteredCategories.isEmpty
          ? const Center(child: Text('No match found'))
          : ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCategories[index]),
                );
              },
            ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: 'Find Cars, Houses ...',
          suffixIcon: searchText.isNotEmpty ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                searchController.clear();
                searchText = '';
              });
            },
          ) : null
        ),
      ),
    );
  }

  // Row _topRow(BuildContext context) {
  //   return Row(
  //     children: [
  //       IconButton(
  //           onPressed: () => Navigator.pop(context),
  //           icon: Icon(Icons.arrow_back_ios_sharp)),
  //       SizedBox(
  //         width: 8,
  //       ),
  //       Text(
  //         'Quick Filters',
  //         style: TextStyle(fontSize: 24.0),
  //       ),
  //     ],
  //   );
  // }
}
