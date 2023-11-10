import 'package:budget_tracker_app/Model/categorymodel.dart';
import 'package:budget_tracker_app/Views/Components/Utils/Helpers/dbHelper.dart';
import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DB_Helper.db_helper.fetchCategoryData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Category>? categorydata = snapshot.data;
            return ListView.builder(
              itemCount: categorydata!.length,
              itemBuilder: (ctx, i) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      "${categorydata[i].category_name}",
                    ),
                    subtitle: Text(
                      "${categorydata[i].id}",
                    ),
                    leading: CircleAvatar(
                      foregroundImage: MemoryImage(
                        categorydata[i].category_image,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          DB_Helper.db_helper
                              .deleteCategory(id: categorydata[i].id!);
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
