import 'package:budget_tracker_app/Controllers/navigationController.dart';
import 'package:budget_tracker_app/Views/Components/Page/addCategory.dart';
import 'package:budget_tracker_app/Views/Components/Page/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController data = Get.put(NavigationController());
    List<Widget> PageList = [
      Add_Cat(),
      Cat(),
    ];
    return Scaffold(
      bottomNavigationBar: GetBuilder<NavigationController>(
        builder: (_) => NavigationBar(
          selectedIndex: data.navigationModel.selectedIndex.value,
          onDestinationSelected: (val) {
            data.changeTab(val: val);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.category),
              label: "Add Category",
            ),
            NavigationDestination(
              icon: Icon(Icons.view_agenda_outlined),
              label: "Category",
            ),
          ],
        ),
      ),
      body: GetBuilder<NavigationController>(
        builder: (_) => PageView(
          onPageChanged: (val) {
            data.changeTab(val: val);
          },
          controller: data.pageController,
          children: PageList,
        ),
      ),
    );
  }
}
