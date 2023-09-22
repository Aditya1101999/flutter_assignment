import 'package:cred/widgets/stack_view_widget.dart';
import 'package:flutter/material.dart';

class StackViewScreen extends StatelessWidget {
  const StackViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    return Scaffold(
      body: CollapsibleStackView(bottomNavigationBarItems: bottomNavigationBarItems),
    );
  }
}
