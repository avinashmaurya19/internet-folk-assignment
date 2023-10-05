import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(.0),
            child: IntrinsicWidth(
              // width: MediaQuery.of(context).size.width - 6,
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Event Name',
                  prefixIcon: Icon(
                    Icons.search,
                    // size: 37,
                    color: Color(0xff7974e7),
                  ),
                  prefixText: '|   ',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
