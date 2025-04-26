import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/widgets/custom_snackbar.dart';
import 'package:fintrack/widgets/custom_text_field.dart';
import 'package:fintrack/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String? newExpense;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: const Text('Add Expense'),
      content: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: 'Expense',
            prefixIcon: const Icon(Icons.attach_money),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              newExpense = value;
            },
          ),
          SubmitButton(
            onPressed: () {
              final double amount = double.tryParse(newExpense ?? '0') ?? 0;

              BlocProvider.of<CategoryCubit>(
                context,
              ).addExpense(widget.categoryModel, amount);
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(color: Colors.green, message: 'Expense Updated'),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
