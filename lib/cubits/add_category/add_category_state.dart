sealed class AddCategoryState {}

final class AddCategoryInitial extends AddCategoryState {}

final class AddCategorySuccess extends AddCategoryState {}

final class AddCategoryLoading extends AddCategoryState {}

final class AddCategoryFaluier extends AddCategoryState {
  final String errMessage;
  AddCategoryFaluier({required this.errMessage});
}
