import 'package:api_exception/exception.dart';
import 'package:bank_sampah/feature/login/domain/model/user_profile.dart';
import 'package:bank_sampah/feature/login/domain/repository/login_repository.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(const LoginState());

  final LoginRepositoryAbstract loginRepository;

  Future<void> login(
    String username,
    String password,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final response = await loginRepository.login(
        username,
        password,
      );
      emit(state.copyWith(
        status: LoginStatus.success,
        userProfile: response,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(
      status: LoginStatus.initial,
      userProfile: null,
    ));
  }
}
