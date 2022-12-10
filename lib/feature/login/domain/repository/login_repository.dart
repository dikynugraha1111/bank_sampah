import 'package:bank_sampah/feature/login/domain/model/user_profile.dart';
import 'package:bank_sampah/feature/login/domain/service/login_service.dart';

abstract class LoginRepositoryAbstract {
  Future<UserProfile> login(
    String username,
    String password,
  );
}

class LoginRepository implements LoginRepositoryAbstract {
  final LoginServiceAbstract loginService;

  LoginRepository({
    required this.loginService,
  });

  @override
  Future<UserProfile> login(
    String username,
    String password,
  ) async {
    return await loginService.login(
      username,
      password,
    );
  }

  factory LoginRepository.create() {
    return LoginRepository(
      loginService: LoginService.create(),
    );
  }
}
