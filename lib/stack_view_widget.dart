// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'stack_data.dart';

class StackViewWidget extends StatefulWidget {
  const StackViewWidget({super.key});

  @override
  _StackViewWidgetState createState() => _StackViewWidgetState();
}

class _StackViewWidgetState extends State<StackViewWidget> {
  List<StackItemData> items = [
    StackItemData('Item 1', 'Content 1', false),
    StackItemData('Item 2', 'Content 2', false),
    StackItemData('Item 3', 'Content 3', false),
  ];

  void toggleItemState(int index) {
    setState(() {
      for (int i = 0; i < items.length; i++) {
        if (i == index) {
          items[i].isExpanded = !items[i].isExpanded;
        } else {
          items[i].isExpanded = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            toggleItemState(index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: item.isExpanded ? Colors.blue : Colors.white,
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
                    item.title,
                    style: TextStyle(
                      color: item.isExpanded ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (item.isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      item.content,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}