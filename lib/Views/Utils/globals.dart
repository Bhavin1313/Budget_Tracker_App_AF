import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

List<String> categoryIcons = [
  "lib/Views/Components/Utils/categoryicons/bill.png",
  "lib/Views/Components/Utils/categoryicons/cash.png",
  "lib/Views/Components/Utils/categoryicons/communication.png",
  "lib/Views/Components/Utils/categoryicons/deposit.png",
  "lib/Views/Components/Utils/categoryicons/food.png",
  "lib/Views/Components/Utils/categoryicons/gift.png",
  "lib/Views/Components/Utils/categoryicons/health.png",
  "lib/Views/Components/Utils/categoryicons/movie.png",
  "lib/Views/Components/Utils/categoryicons/other.png",
  "lib/Views/Components/Utils/categoryicons/rupee.png",
  "lib/Views/Components/Utils/categoryicons/salary.png",
  "lib/Views/Components/Utils/categoryicons/shopping.png",
  "lib/Views/Components/Utils/categoryicons/transport.png",
  "lib/Views/Components/Utils/categoryicons/wallet.png",
  "lib/Views/Components/Utils/categoryicons/withdraw.png",
];

class Global {
  static int initialIndex = 0;
  static PageController pageController = PageController();
  static String? cat_name;
  static TextEditingController categoryController = TextEditingController();
  static ByteData? imgdata;
}
