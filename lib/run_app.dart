import 'package:fintrack/cubits/category/category_cubit.dart';
import 'package:fintrack/helpers/constants.dart';
import 'package:fintrack/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinTrack extends StatelessWidget {
  const FinTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Arial',
        ),
        home: const HomeView(),
      ),
    );
  }
}
