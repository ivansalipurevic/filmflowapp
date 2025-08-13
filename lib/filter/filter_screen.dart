import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedSort = -1;
  List<String> years = [
    "2024 - 2025",
    "2022 - 2023",
    "2010 - 2020",
    "2000 - 2009",
    "1990 - 2000",
    "1980 - 1989",
  ];
  Set<int> selectedYears = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filter",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sort by",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Column(
              children: List.generate(3, (index) {
                return RadioListTile<int>(
                  value: index,
                  groupValue: selectedSort,
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value!;
                    });
                  },
                  title: const Text("Label"),
                );
              }),
            ),
            const SizedBox(height: 16),

            
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Genre",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("All", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {},
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Country",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("All", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {},
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Rating",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("All", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {},
            ),

            const SizedBox(height: 16),
            const Text("Year", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            
            Wrap(
              spacing: 8,
              children: List.generate(years.length, (index) {
                final isSelected = selectedYears.contains(index);
                return ChoiceChip(
                  label: Text(years[index]),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedYears.add(index);
                      } else {
                        selectedYears.remove(index);
                      }
                    });
                  },
                  selectedColor: Colors.black,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  backgroundColor: Colors.grey[300],
                );
              }),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
