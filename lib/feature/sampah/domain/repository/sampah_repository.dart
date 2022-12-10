import 'package:bank_sampah/feature/sampah/domain/model/sampah_response.dart';
import 'package:bank_sampah/feature/sampah/domain/service/sampah_service.dart';

abstract class SampahRepository {
  Future<SampahItemResponse> onInitSampahItem();
}

class SampahRepositoryImpl implements SampahRepository {
  final SampahService service;

  SampahRepositoryImpl(this.service);

  @override
  Future<SampahItemResponse> onInitSampahItem() async {
    return await service.onInitSampahItem();
  }

  factory SampahRepositoryImpl.create() {
    return SampahRepositoryImpl(SampahServiceImpl.create());
  }
}
