import 'package:flutter/material.dart';

class FilterOptionsList extends StatelessWidget {
  const FilterOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
