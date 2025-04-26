import 'package:fintrack/cubits/add_category/add_category_cubit.dart';
import 'package:fintrack/cubits/add_category/add_category_state.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/widgets/custom_snackbar.dart';
import 'package:fintrack/widgets/custom_text_field.dart';
import 'package:fintrack/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryForm extends StatefulWidget {
  const AddCategoryForm({super.key});

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, budget, expense;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            hintText: 'Category Name',
            onSaved: (value) {
              name = value;
            },
          ),
          CustomTextField(
            hintText: 'Budget',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.attach_money),
            onSaved: (value) {
              budget = value;
            },
          ),
          CustomTextField(
            hintText: 'Expenses',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.attach_money),
            onSaved: (value) {
              expense = value;
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<AddCategoryCubit, AddCategoryState>(
            builder: (context, state) {
              return SubmitButton(
                isLoading: state is AddCategoryLoading ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var categoryModel = CategoryModel(
                      budget: double.parse(budget!),
                      expense: double.parse(expense!),
                      name: name!,
                    );
                    BlocProvider.of<AddCategoryCubit>(
                      context,
                    ).addCategory(categoryModel);
                    ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(
                        color: Colors.green,
                        message: 'Category Added',
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
