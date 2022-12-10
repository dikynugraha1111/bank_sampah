import 'package:bank_sampah/common/endpoint/endpoint.dart';
import 'package:bank_sampah/common/http_client/http_client.dart';
import 'package:bank_sampah/feature/login/domain/repository/login_repository.dart';
import 'package:bank_sampah/feature/login/logic/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Injection {
  static final Map<String, String> defaultBearerToken = {
    "Authorization": "Bearer"
  };

  static final HttpClient httpClient = CoinsleekHttpClient.create();
  static final Endpoint endpoint = Endpoint.staging();
  static final List<BlocProvider> providerList = [
    BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        loginRepository: LoginRepository.create(),
      ),
    ),
  ];
}
