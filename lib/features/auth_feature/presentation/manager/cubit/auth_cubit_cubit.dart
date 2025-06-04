import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/services/supabase_service.dart';
import 'package:fruits_dashboard/features/auth_feature/domain/base_repositories/auth_base_repo.dart';
import 'package:fruits_dashboard/features/auth_feature/presentation/manager/cubit/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthBaseRepo _repo;
  final SupabaseService _supabase;
  bool isPasswordVisible = false;

  AuthCubit(this._repo, this._supabase) : super(AuthInitial());

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthPasswordVisibilityChanged());
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      // Sign in
      await _repo.signIn(email, password);

      // Get user ID
      final userId = _supabase.getSession()?.user.id;
      if (userId == null) throw Exception("User not found");

      // Check admin flag
      final isAdmin = await _repo.isUserAdmin(userId);
      if (isAdmin) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Access denied: Not an admin."));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
