part of 'profile_cubit.dart';

enum ProfileStateStatus {
  initial,
  loading,
  success,
  failure,
}

extension ProfileStateStatuX on ProfileStateStatus {
  bool get isInitial => this == ProfileStateStatus.initial;
  bool get isLoading => this == ProfileStateStatus.loading;
  bool get isSuccess => this == ProfileStateStatus.success;
  bool get isFailure => this == ProfileStateStatus.failure;
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStateStatus.initial,
    this.exception,
    this.balance,
  });

  final ProfileStateStatus status;
  final AppException? exception;
  final String? balance;

  ProfileState copyWith({
    ProfileStateStatus? status,
    AppException? exception,
    String? balance,
  }) {
    return ProfileState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        balance,
      ];
}
