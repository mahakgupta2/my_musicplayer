import 'package:app/core/configs/usecase/usecase.dart';
import 'package:app/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';

import '../../../../domain/repository/auth/auth.dart';
import '../../../../presentation/service_locator.dart';

class  SignupUseCase implements UseCase<Either,CreateUserReq> {
  SignupUseCase(AuthRepository authRepository);

  @override
  Future<Either> call({CreateUserReq ?params}) async {
    return sl<AuthRepository>().signup(params!);
  }

}
