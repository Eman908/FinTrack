import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/widgets/edit_category_body.dart';
import 'package:flutter/material.dart';

class EditCategoryView extends StatelessWidget {
  const EditCategoryView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditCategoryBody(category: category));
  }
}
