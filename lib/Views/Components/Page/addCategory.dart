import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Controllers/navigationController.dart';
import '../../Utils/globals.dart';
import 'package:budget_tracker_app/Model/categorymodel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Utils/Helpers/dbHelper.dart';

class Add_Cat extends StatelessWidget {
  Add_Cat({super.key});

  NavigationController data = Get.find();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState?.save();

            Uint8List category_image =
                await Global.imgdata!.buffer.asUint8List();
            Category category_data = Category(
              category_name: Global.cat_name!,
              category_image: category_image,
            ); // Cate

            int? res = await DB_Helper.db_helper.insertCategory(
              cat_data: category_data,
            );
            Get.snackbar(
              "Budget Tracker App",
              "Data Successfully Inserted on $res....",
            );
            Global.categoryController.clear();
          } else {
            Get.snackbar(
              "Budget Tracker App",
              "Data Insertion Failed...",
              backgroundColor: Colors.red.withOpacity(0.7),
            );
          }
        },
        label: Text("Add Category"),
        icon: Icon(Icons.add),
      ), // FloatingActionButton.extended
      appBar: AppBar(
        title: Text("Add Category"),
        centerTitle: true,
      ), // AppBor
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: Global.categoryController,
                onSaved: (val) {
                  Global.cat_name = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Valid Category..";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter Category Name.....",
                  border: OutlineInputBorder(),
                ),
              ), // TextFormField
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemCount: categoryIcons.length,
                  itemBuilder: (ctx, i) => Obx(
                    () => GestureDetector(
                      onTap: () async {
                        data.setSelectedindex(i: i);
                        Global.imgdata =
                            await rootBundle.load(categoryIcons[i]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: (data.Selectedindex == i)
                                  ? Colors.black
                                  : Colors.white), // Border.al
                          image: DecorationImage(
                            image: AssetImage(
                              categoryIcons[i],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} // Scaffold
