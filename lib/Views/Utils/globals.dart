import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

List<String> categoryIcons = [
  "Lib/Views/Components/Utils/category icons/bill.png",
  "Lib/Views/Components/Utils/category icons/cash.png",
  "Lib/Views/Components/Utils/category icons/communication.png",
  "Lib/Views/Components/Utils/category icons/deposit.png",
  "Lib/Views/Components/Utils/category icons/food.png",
  "Lib/Views/Components/Utils/category icons/gift.png",
  "Lib/Views/Components/Utils/category icons/health.png",
  "Lib/Views/Components/Utils/category icons/movie.png",
  "Lib/Views/Components/Utils/category icons/other.png",
  "Lib/Views/Components/Utils/category icons/rupee.png",
  "lib/Views/Components/Utils/category icons/salary.png",
  "Lib/Views/Components/Utils/category icons/shopping.png",
  "lib/Views/Components/Utils/category icons/transport.png",
  "lib/Views/Components/Utils/category icons/wallet.png",
  "Lib/Views/Components/Utils/category icons/withdraw.png",
];

class Global {
  static int initialIndex = 0;
  static PageController pageController = PageController();
  static String? cat_name;
  static TextEditingController categoryController = TextEditingController();
  static ByteData? imgdata;
}
