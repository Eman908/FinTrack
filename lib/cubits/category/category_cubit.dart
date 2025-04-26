import 'package:fintrack/cubits/category/category_state.dart';
import 'package:fintrack/helpers/constants.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<CategoryModel>? category;
  fetchCategory() {
    var categoryBox = Hive.box<CategoryModel>(kCategoryBox);
    category = categoryBox.values.toList();
    emit(CategorySuccess());
  }

  addExpense(CategoryModel category, double newExpense) {
    category.expense += newExpense;
    category.save();
    emit(CategoryUpdate());
  }

  double getTotal(String type) {
    if (type == 'budget') {
      return category!.fold(0, (sum, item) => sum + item.budget);
    } else {
      return category!.fold(0, (sum, item) => sum + item.expense);
    }
  }
}
