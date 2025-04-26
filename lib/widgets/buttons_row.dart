import 'package:fintrack/helpers/constants.dart';
import 'package:fintrack/models/category_model.dart';
import 'package:fintrack/views/edit_category_view.dart';
import 'package:fintrack/widgets/add_expense.dart';
import 'package:fintrack/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, this.onPressed, required this.categoryModel});
  final void Function()? onPressed;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          color: kPrimaryButtonColor,
          iconData: Icons.add,
          iconColor: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddExpense(categoryModel: categoryModel),
            );
          },
        ),
        CustomButton(
          color: kSecondaryButtonColor,
          iconData: Icons.edit,
          iconColor: Colors.grey,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return EditCategoryView(category: categoryModel);
                },
              ),
            );
          },
        ),
        CustomButton(
          color: kDeleteButtonColor,
          iconData: Icons.delete,
          iconColor: Colors.red,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
