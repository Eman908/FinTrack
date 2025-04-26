import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.title,
    required this.money,
    this.color = Colors.black,
  });
  final String title;
  final String money;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: color, fontSize: 18)),
        Text(
          money,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
