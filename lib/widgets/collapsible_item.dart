import 'package:flutter/material.dart';

class CollapsibleItem extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<BottomNavigationBarItem> bottomNavigationBarItems;
  final bool isBottomNavExpanded;
  final int selectedBottomNavItem;
  final VoidCallback onBottomNavToggle;
  final ValueChanged<int> onBottomNavItemTap;

  const CollapsibleItem({super.key, 
    required this.title,
    required this.content,
    required this.isExpanded,
    required this.onTap,
    required this.bottomNavigationBarItems,
    required this.isBottomNavExpanded,
    required this.selectedBottomNavItem,
    required this.onBottomNavToggle,
    required this.onBottomNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isExpanded ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: isExpanded ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    for (int i = 0; i < bottomNavigationBarItems.length; i++)
                      GestureDetector(
                        onTap: () {
                          onBottomNavItemTap(i);
                        },
                        child: Text(
                          bottomNavigationBarItems[i].label!,
                        ),
                      ),
                  ],
                ),
              ),
            if (isBottomNavExpanded)
              GestureDetector(
                onTap: onBottomNavToggle,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  height: 8,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
