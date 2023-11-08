import 'dart:typed_data';

class Category {
  int? id;
  String category_name;
  Uint8List category_image;

  Category({
    required this.category_name,
    required this.category_image,
  });

  factory Category.fromSQL({required Map data}) {
    return Category(
      category_name: data['category_name'],
      category_image: data['category_image'],
    );
  }
}
