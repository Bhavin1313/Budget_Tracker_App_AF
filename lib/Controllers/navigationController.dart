import 'package:budget_tracker_app/Model/navigationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  NavigationModel navigationModel = NavigationModel(selectedIndex: 0.obs);
  PageController pageController = PageController();
  RxInt Selectedindex = 0.obs;

  void changeTab({required int val}) {
    navigationModel.selectedIndex(val);
    pageController.animateToPage(val,
        duration: Duration(microseconds: 200), curve: Curves.linear);
    update();
  }

  void setSelectedindex({required int i}) {
    Selectedindex(i);
  }
}
