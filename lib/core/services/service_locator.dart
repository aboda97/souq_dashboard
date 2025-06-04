import 'package:fruits_dashboard/core/services/supabase_service.dart';
import 'package:fruits_dashboard/features/auth_feature/domain/base_repositories/auth_base_repo.dart';
import 'package:fruits_dashboard/features/auth_feature/data/repositories/auth_repo_impl.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  //-------> Initialize SharedPreferences before registering it  <--------------//
  //final sharedPreferences = await SharedPreferences.getInstance();
  // serviceLocator.registerLazySingleton<SharedPreferences>(
  //   () => sharedPreferences,
  // );

  //-----------------> SERVICES  <-----------------//
  serviceLocator.registerLazySingleton<SupabaseService>(
    () => SupabaseService(),
  );

  //-----------------> CUBITS  <-----------------//
  serviceLocator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      serviceLocator<AuthBaseRepo>(),
      serviceLocator<SupabaseService>(),
    ),
  );

  //-----------------> REPOSITORIES  <-----------------//
  serviceLocator.registerLazySingleton<AuthBaseRepo>(
    () => AuthRepoImpl(serviceLocator<SupabaseService>()),
  );

  //-----------------> BLOC OBSERVER  <-----------------//
}
