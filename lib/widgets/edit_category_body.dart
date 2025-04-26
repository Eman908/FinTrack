import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/widgets/custom_appbar.dart';
import 'package:fintrack/widgets/custom_snackbar.dart';
import 'package:fintrack/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCategoryBody extends StatefulWidget {
  const EditCategoryBody({super.key, required this.category});
  final CategoryModel category;
  @override
  State<EditCategoryBody> createState() => _EditCategoryBodyState();
}

class _EditCategoryBodyState extends State<EditCategoryBody> {
  String? name, budget, expense;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          CustomeAppBar(
            title: 'Edit',
            icon: Icons.check,
            onPressed: () {
              if (name != null) {
                widget.category.name = name!;
              }
              if (budget != null) {
                widget.category.budget =
                    double.tryParse(budget!) ?? widget.category.budget;
              }
              if (expense != null) {
                widget.category.expense =
                    double.tryParse(expense!) ?? widget.category.expense;
              }

              widget.category.save();
              BlocProvider.of<CategoryCubit>(context).fetchCategory();
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(color: Colors.green, message: 'Category Edited'),
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 32),
          CustomTextField(
            hintText: 'Category Name',
            onChanged: (value) {
              name = value;
            },
            initialValue: widget.category.name,
          ),
          const SizedBox(height: 16),

          CustomTextField(
            hintText: 'Budget',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.attach_money),
            onChanged: (value) {
              budget = value;
            },
            initialValue: widget.category.budget.toString(),
          ),
          const SizedBox(height: 16),

          CustomTextField(
            hintText: 'Expenses',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.attach_money),
            onChanged: (value) {
              expense = value;
            },
            initialValue: widget.category.expense.toString(),
          ),
        ],
      ),
    );
  }
}
