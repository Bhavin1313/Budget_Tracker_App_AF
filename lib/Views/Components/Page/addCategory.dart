import 'package:flutter/material.dart';

class AddCat extends StatelessWidget {
  const AddCat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Category",
        ),
        centerTitle: true,
      ),
    );
  }
}
