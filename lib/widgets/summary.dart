import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/cubits/category/category_state.dart';
import 'package:fintrack/widgets/summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SummaryRow(
                title: 'Total Budegt',
                money:
                    "\$ ${BlocProvider.of<CategoryCubit>(context).getTotal('budget').toString()}",
              ),
              const Divider(thickness: 2),
              SummaryRow(
                title: 'Total Spent',
                money:
                    "\$ ${BlocProvider.of<CategoryCubit>(context).getTotal('expense').toString()}",
                color: Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}
