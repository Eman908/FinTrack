import 'package:fintrack/cubits/add_category/add_category_state.dart';
import 'package:fintrack/helpers/constants.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitial());

  addCategory(CategoryModel category) {
    emit(AddCategoryLoading());
    try {
      var categoryBox = Hive.box<CategoryModel>(kCategoryBox);
      categoryBox.add(category);
      emit(AddCategorySuccess());
    } catch (e) {
      emit(AddCategoryFaluier(errMessage: e.toString()));
    }
  }
}
