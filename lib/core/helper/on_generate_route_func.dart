import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/add_product_feature/presentation/views/add_product_view.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/views/login_view.dart';
import 'package:fruits_dashboard/features/dashboard_feature/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductView());

    default:
      return MaterialPageRoute(builder: (_) => const DashboardView());
  }
}
