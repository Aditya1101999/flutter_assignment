// ignore_for_file: library_private_types_in_public_api

import 'package:cred/models/stack_data.dart';
import 'package:flutter/material.dart';
import 'collapsible_item.dart';
class CollapsibleStackView extends StatefulWidget {
  final List<BottomNavigationBarItem> bottomNavigationBarItems;

  const CollapsibleStackView({super.key, required this.bottomNavigationBarItems});

  @override
  _CollapsibleStackViewState createState() => _CollapsibleStackViewState();
}

class _CollapsibleStackViewState extends State<CollapsibleStackView> {
  bool isBottomNavExpanded = false;
  int selectedBottomNavItem = 0;

  List<StackItemData> items = [
    StackItemData('Item 1', 'Content 1', false),
    StackItemData('Item 2', 'Content 2', false),
    StackItemData('Item 3', 'Content 3', false),
  ];

  void toggleBottomNav() {
    setState(() {
      isBottomNavExpanded = !isBottomNavExpanded;
    });
  }

  void onBottomNavItemTap(int index) {
    setState(() {
      selectedBottomNavItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              final item = items[index];
              return CollapsibleItem(
                title: item.title,
                content: item.content,
                isExpanded: item.isExpanded,
                onTap: () {
                  setState(() {
                    for (int i = 0; i < items.length; i++) {
                      if (i == index) {
                        items[i].isExpanded = !items[i].isExpanded;
                      } else {
                        items[i].isExpanded = false;
                      }
                    }
                    isBottomNavExpanded = items[index].isExpanded;
                  });
                },
                bottomNavigationBarItems: widget.bottomNavigationBarItems,
                isBottomNavExpanded: isBottomNavExpanded,
                selectedBottomNavItem: selectedBottomNavItem,
                onBottomNavToggle: toggleBottomNav,
                onBottomNavItemTap: onBottomNavItemTap,
              );
            },
          ),
        ),
        if (isBottomNavExpanded)
          BottomNavigationBar(
            items: widget.bottomNavigationBarItems,
            currentIndex: selectedBottomNavItem,
            onTap: onBottomNavItemTap,
          ),
      ],
    );
  }
}