import 'package:bank_sampah/feature/profile/domain/service/profile_service.dart';

abstract class ProfileRepositoryAbstract {
  Future<String> onGetBalance(String userID);
}

class ProfileRepository implements ProfileRepositoryAbstract {
  final ProfileServiceAbstract profileService;

  ProfileRepository({
    required this.profileService,
  });

  @override
  Future<String> onGetBalance(String userID) async {
    return await profileService.onGetBalance(userID);
  }

  factory ProfileRepository.create() {
    return ProfileRepository(
      profileService: ProfileService.create(),
    );
  }
}
