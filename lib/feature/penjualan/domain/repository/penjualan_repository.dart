import 'package:bank_sampah/feature/penjualan/domain/model/penjualan_sampah_response.dart';
import 'package:bank_sampah/feature/penjualan/domain/service/penjualan_service.dart';

abstract class PenjualanRepositoryAbstract {
  Future<BankSampahResponse> onGetAllPenjualanData(String userID);
}

class PenjualanRepository implements PenjualanRepositoryAbstract {
  final PenjualanServiceAbstract penjualanService;

  PenjualanRepository({
    required this.penjualanService,
  });

  @override
  Future<BankSampahResponse> onGetAllPenjualanData(String userID) async {
    return await penjualanService.onGetAllPenjualanData(userID);
  }

  factory PenjualanRepository.create() {
    return PenjualanRepository(
      penjualanService: PenjualanService.create(),
    );
  }
}
