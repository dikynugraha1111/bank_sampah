import 'package:api_exception/exception.dart';
import 'package:bank_sampah/feature/sampah/domain/model/sampah_response.dart';
import 'package:equatable/equatable.dart';

enum SampahStatus {
  initial,
  loading,
  loaded,
  error,
}

extension SampahStatusX on SampahStatus {
  bool get isLoading => this == SampahStatus.initial;
  bool get isLoaded => this == SampahStatus.loaded;
  bool get isError => this == SampahStatus.error;
}

class SampahState extends Equatable {
  final bool isLoading;
  final SampahStatus status;
  final AppException? error;
  final SampahItemResponse? bankSampahResponse;

  const SampahState({
    this.isLoading = false,
    this.status = SampahStatus.initial,
    this.error,
    this.bankSampahResponse,
  });

  SampahState copyWith({
    bool? isLoading,
    SampahStatus? status,
    AppException? error,
    SampahItemResponse? bankSampahResponse,
  }) {
    return SampahState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      error: error ?? this.error,
      bankSampahResponse: bankSampahResponse ?? this.bankSampahResponse,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        bankSampahResponse,
      ];
}
