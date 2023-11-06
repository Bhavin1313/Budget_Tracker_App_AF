import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/Screens/homepage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        )
      ],
    ),
  );
}
