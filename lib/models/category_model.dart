import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double expense;
  @HiveField(2)
  double budget;

  CategoryModel({
    required this.budget,
    required this.expense,
    required this.name,
  });
}
