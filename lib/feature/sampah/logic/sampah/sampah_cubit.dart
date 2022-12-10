import 'package:api_exception/exception.dart';
import 'package:bank_sampah/feature/sampah/domain/model/sampah_response.dart';
import 'package:bank_sampah/feature/sampah/domain/repository/sampah_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_sampah/feature/sampah/logic/sampah/sampah_state.dart';

class SampahCubit extends Cubit<SampahState> {
  SampahCubit(this.repository) : super(const SampahState());

  final SampahRepository repository;

  Future<void> onInit() async {
    state.copyWith(status: SampahStatus.loading);
    try {
      final SampahItemResponse response = await repository.onInitSampahItem();
      emit(state.copyWith(
        bankSampahResponse: response,
        status: SampahStatus.loaded,
      ));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: SampahStatus.error,
        error: e,
      ));
    }
  }
}
