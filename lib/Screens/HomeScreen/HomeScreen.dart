// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:interview/Helpers/Colors/Colors.dart';
import 'package:interview/Helpers/Variables/Variable.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _data = [
    {"name": "Januyan", "email": "januyan@gmail.com", "DOB": "17/11/200"},
    {"name": "cypher", "email": "cypher@gmail.com", "DOB": "17/11/200"},
    {"name": "stfrix", "email": "stfrix@gmail.com", "DOB": "16/11/200"},
    {"name": "ajay", "email": "ajay@gmail.com", "DOB": "17/231/200"},
    {"name": "kumat", "email": "kumat@gmail.com", "DOB": "23/11/200"},
    {"name": "nupun", "email": "nupun@gmail.com", "DOB": "14/11/200"},
    {"name": "sandimal", "email": "sandimal@gmail.com", "DOB": "11/11/200"},
    {"name": "abc", "email": "abc@gmail.com", "DOB": "19/11/200"},
    {"name": "abc", "email": "zyz@gmail.com", "DOB": "20/11/200"},
    {"name": "abc", "email": "bmw@gmail.com", "DOB": "31/11/200"},
  ];

  List<Map<String, String>> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchResults.addAll(_data);
  }

  void _filterSearchResults(String query) {
    List<Map<String, String>> searchResults = [];

    if (query.isNotEmpty) {
      _data.forEach((item) {
        if (item["name"]!.toLowerCase().contains(query.toLowerCase()) ||
            item["email"]!.toLowerCase().contains(query.toLowerCase()) ||
            item["DOB"]!.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
    } else {
      searchResults.addAll(_data);
    }
    setState(() {
      _searchResults.clear();
      _searchResults.addAll(searchResults);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    _filterSearchResults(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _filterSearchResults('');
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                height: screenHeight,
                width: screenWidth,
                child: ListView.separated(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color:
                            HexColor("#E2F9FE"), // Change the color as needed
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: ListTile(
                        title: Text(
                          _searchResults[index]["name"] ?? '',
                          style: TextStyle(
                            color:
                                Colors.blue, // Change the text color as needed
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Email: ${_searchResults[index]["email"] ?? ''}",
                                style: textStyleHome),
                            Text("DOB: ${_searchResults[index]["DOB"] ?? ''}",
                                style: textStyleHome),
                          ],
                        ),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 10,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
