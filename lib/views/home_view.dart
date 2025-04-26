import 'package:fintrack/widgets/home_view_body.dart';
import 'package:fintrack/widgets/summary.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(bottomNavigationBar: Summary(), body: HomeViewBody());
  }
}
