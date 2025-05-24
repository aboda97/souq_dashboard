import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'LoginView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LoginViewBody()));
  }
}
