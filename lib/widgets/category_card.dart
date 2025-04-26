import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/helpers/constants.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/widgets/buttons_row.dart';
import 'package:fintrack/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardColor,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: kHeaderColor,
              ),
            ),
            const SizedBox(height: 32),
            LinearProgressIndicator(
              value: category.expense / category.budget,
              minHeight: 8,
              color:
                  category.expense > category.budget ? Colors.red : kBarsColor,
              backgroundColor: const Color(0xffD4D4D4),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spent: \$ ${category.expense}",
                  style: TextStyle(
                    color:
                        category.expense > category.budget
                            ? Colors.red
                            : Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Budget: \$ ${category.budget}",
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ButtonsRow(
              onPressed: () {
                category.delete();
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    color: Colors.red,
                    message: 'Category Deleted',
                  ),
                );
                BlocProvider.of<CategoryCubit>(context).fetchCategory();
              },
              categoryModel: category,
            ),
          ],
        ),
      ),
    );
  }
}
