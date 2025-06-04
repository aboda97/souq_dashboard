import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper/on_generate_route_func.dart';
import 'package:fruits_dashboard/core/services/service_locator.dart';
import 'package:fruits_dashboard/core/services/supabase_service.dart';
import 'package:fruits_dashboard/core/utils/back_end_points_paths.dart';
import 'package:fruits_dashboard/features/auth_feature/domain/base_repositories/auth_base_repo.dart';
import 'package:fruits_dashboard/features/auth_feature/data/repositories/auth_repo_impl.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/views/login_view.dart';
import 'package:fruits_dashboard/features/dashboard_feature/presentation/views/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // await SharedPreferencesService.init();
  await Supabase.initialize(
    url: SupaBasePaths.projectUrl,
    anonKey: SupaBasePaths.supbaseAnonKey,
  );

  final supabaseService = SupabaseService();
  final authRepo = AuthRepoImpl(supabaseService);
  await setupLocator();
  runApp(MyApp(authRepo: authRepo, supabaseService: supabaseService));
}

class MyApp extends StatelessWidget {
  final AuthBaseRepo authRepo;
  final SupabaseService supabaseService;
  const MyApp({
    super.key,
    required this.authRepo,
    required this.supabaseService,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<AuthCubit>(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dashboard',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: LoginView.routeName,
      ),
    );
  }
}
