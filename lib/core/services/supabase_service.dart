import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final _client = Supabase.instance.client;

  Future<AuthResponse> signIn(String email, String password) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    final data =
        await _client
            .from('profiles')
            .select('is_admin')
            .eq('id', userId)
            .single();

    return data;
  }

  Session? getSession() => _client.auth.currentSession;

  Future<void> signOut() async => await _client.auth.signOut();
}
