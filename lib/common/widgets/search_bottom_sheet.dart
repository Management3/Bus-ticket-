import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  SearchBottomSheetState createState() => SearchBottomSheetState();
}

class SearchBottomSheetState extends State<SearchBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allItems = [
    'Accra to Kumasi 6am',
    'Sunyani to Kumasi 8am',
    'Sunyani to Accra 4am',
    'Kumasi to Sunyani 10am',
    'Kumasi to Accra 12pm',
    'Accra to Sunyani 10pm',
    'Sunyani to Cape Coast 4am',
    'Cape Coast to Sunyani 4am',
    'Kumasi to Ho 8am',
    'Ho to Kumasi 8am',
    'Tamale to Kumasi 10am',
    'Kumasi to Tamale 10m',
    'Accra to Tamale 4am',
    'Tamale to Accra 4am',
  ];
  final List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(_allItems); // Initially, all items are shown.
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      _filteredItems.addAll(_allItems);
    } else {
      _filteredItems.clear();
      for (String item in _allItems) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          _filteredItems.add(item);
        }
      }
    }
    setState(() {}); // Update the UI with the filtered items.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              _filterItems(value);
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              hintText: "Filter by From",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.pushRoute(const BookingRoute());
                },
                title: Text(_filteredItems[index]),
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  color: const Color(0xFF0094FF),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
