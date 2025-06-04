abstract class AuthBaseRepo {
  Future<void> signIn(String email, String password);
  Future<bool> isUserAdmin(String userId);
}
