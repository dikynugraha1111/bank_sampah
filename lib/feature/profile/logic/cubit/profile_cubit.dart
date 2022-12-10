import 'package:api_exception/exception.dart';
import 'package:bank_sampah/feature/profile/domain/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(const ProfileState());

  final ProfileRepositoryAbstract profileRepository;

  Future<void> onInitProfile(String userID) async {
    emit(state.copyWith(status: ProfileStateStatus.loading));
    try {
      final response = await profileRepository.onGetBalance(userID);
      emit(state.copyWith(
        status: ProfileStateStatus.success,
        balance: response,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: ProfileStateStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProfileStateStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}
