import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/cubits/category/category_state.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCardBuilder extends StatelessWidget {
  const CategoryCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        List<CategoryModel> category =
            BlocProvider.of<CategoryCubit>(context).category!;
        if (category.isEmpty) {
          return const Center(
            child: Text(
              'No Categories Yet',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CategoryCard(category: category[index]),
            );
          },
        );
      },
    );
  }
}
