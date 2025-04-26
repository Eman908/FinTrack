import 'package:fintrack/bloc/bloc_observer.dart';
import 'package:fintrack/helpers/constants.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/run_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>(kCategoryBox);
  runApp(const FinTrack());
}
