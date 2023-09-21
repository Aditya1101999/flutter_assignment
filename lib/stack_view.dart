import 'package:cred/stack_data.dart';

class StackAbstraction {
  late List<StackItemData> items;

  StackAbstraction() {
    items = [
      StackItemData('Item 1', 'Content 1', false),
      StackItemData('Item 2', 'Content 2', false),
      StackItemData('Item 3', 'Content 3', false),
    ];
  }

  void toggleItemState(int index) {
    for (int i = 0; i < items.length; i++) {
      if (i == index) {
        items[i].isExpanded = !items[i].isExpanded;
      } else {
        items[i].isExpanded = false;
      }
    }
  }
}
