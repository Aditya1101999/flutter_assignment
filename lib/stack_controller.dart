class StackController {
  
  List<StackItemController> itemControllers = [];
  void addItemController(StackItemController itemController) {
    itemControllers.add(itemController);
  }

  void toggleExpand(StackItemController selectedController) {
    for (var controller in itemControllers) {
      if (controller == selectedController) {
        controller.toggleExpand();
      } else {
        controller.collapse();
      }
    }
  }
}

class StackItemController {
  bool isExpanded = false;
  Function() onExpandStateChanged;

  StackItemController({required this.onExpandStateChanged});

  void toggleExpand() {
    isExpanded = !isExpanded;
    onExpandStateChanged();
    }

  void collapse() {
    isExpanded = false;
    onExpandStateChanged();
    }
}
