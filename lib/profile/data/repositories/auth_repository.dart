abstract class AuthRepository {
  Future<void> registerUser(String email, String password);

  Future<void> loginUser(String email, String password);
}
