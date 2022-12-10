import 'package:api_exception/api_exception.dart';
import 'package:bank_sampah/feature/penjualan/domain/model/penjualan_sampah_response.dart';
import 'package:bank_sampah/feature/penjualan/domain/repository/penjualan_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'penjualan_state.dart';

class PenjualanCubit extends Cubit<PenjualanState> {
  PenjualanCubit(this.penjualanRepository) : super(const PenjualanState());

  final PenjualanRepositoryAbstract penjualanRepository;

  Future<void> onGetAllPenjualanData(String userID) async {
    emit(state.copyWith(status: PenjualanStateStatus.loading));
    try {
      final response = await penjualanRepository.onGetAllPenjualanData(userID);
      emit(state.copyWith(
        status: PenjualanStateStatus.success,
        bankSampahResponse: response,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: PenjualanStateStatus.failure,
        exception: exception,
      ));
    } on StateError {
      return;
    } catch (e) {
      emit(state.copyWith(
        status: PenjualanStateStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}
