import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/dashboard_feature/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  static const String routeName = 'SplashView';
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: const DashboardViewBody(),
    );
  }
}
