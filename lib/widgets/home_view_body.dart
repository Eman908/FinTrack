import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/widgets/category_bottom_sheet.dart';
import 'package:fintrack/widgets/category_builder.dart';
import 'package:fintrack/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeAppBar(
            title: 'FinTrack',
            icon: Icons.add,
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return const CategoryBottomSheet();
                },
              );
            },
          ),
          const SizedBox(height: 32),
          const Text('Categories', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          const Expanded(child: CategoryCardBuilder()),
        ],
      ),
    );
  }
}
