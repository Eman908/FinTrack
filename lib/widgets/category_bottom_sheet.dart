import 'package:fintrack/cubits/add_category/add_category_cubit.dart';
import 'package:fintrack/cubits/add_category/add_category_state.dart';
import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/widgets/add_category_form.dart';
import 'package:fintrack/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: BlocConsumer<AddCategoryCubit, AddCategoryState>(
        listener: (context, state) {
          if (state is AddCategoryFaluier) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(color: Colors.red, message: 'Something Is Wrong'),
            );
          }
          if (state is AddCategorySuccess) {
            BlocProvider.of<CategoryCubit>(context).fetchCategory();

            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddCategoryLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 16),
                child: AddCategoryForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
