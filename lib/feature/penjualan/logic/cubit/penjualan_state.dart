part of 'penjualan_cubit.dart';

enum PenjualanStateStatus {
  initial,
  loading,
  success,
  failure,
}

extension PenjualanStateStatuX on PenjualanStateStatus {
  bool get isInitial => this == PenjualanStateStatus.initial;
  bool get isLoading => this == PenjualanStateStatus.loading;
  bool get isSuccess => this == PenjualanStateStatus.success;
  bool get isFailure => this == PenjualanStateStatus.failure;
}

class PenjualanState extends Equatable {
  const PenjualanState({
    this.status = PenjualanStateStatus.initial,
    this.exception,
    this.bankSampahResponse,
  });

  final PenjualanStateStatus status;
  final AppException? exception;
  final BankSampahResponse? bankSampahResponse;

  PenjualanState copyWith({
    PenjualanStateStatus? status,
    AppException? exception,
    BankSampahResponse? bankSampahResponse,
  }) {
    return PenjualanState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      bankSampahResponse: bankSampahResponse ?? this.bankSampahResponse,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        bankSampahResponse,
      ];
}
