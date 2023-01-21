import 'package:flutter_application_1/404/bloc/features/login/model/login_model.dart';
import 'package:flutter_application_1/404/bloc/features/login/service/login_service.dart';
import 'package:flutter_application_1/product/service/vexena_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ILoginService loginService;

  setUp(
    () {
      loginService = LoginService(VexanaNetworkManager());
    },
  );
  test(
    'Login Test -eve.holt@reqres.in & cityslicka',
    () async {
      final response = await loginService.login(LoginModel('eve.holt@reqres.in', 'cityslicka'));

      expect(response?.data, isNotNull);
    },
  );
}
