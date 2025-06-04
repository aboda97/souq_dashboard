import 'package:fruits_dashboard/core/services/supabase_service.dart';
import 'package:fruits_dashboard/features/auth_feature/domain/base_repositories/auth_base_repo.dart';

class AuthRepoImpl implements AuthBaseRepo {
  final SupabaseService _supabase;

  AuthRepoImpl(this._supabase);

  @override
  Future<void> signIn(String email, String password) async {
    final res = await _supabase.signIn(email, password);
    if (res.user == null) {
      throw Exception("Login failed.");
    }
  }

  @override
  Future<bool> isUserAdmin(String userId) async {
    final profile = await _supabase.getUserProfile(userId);
    return profile['is_admin'] == true;
  }
}
