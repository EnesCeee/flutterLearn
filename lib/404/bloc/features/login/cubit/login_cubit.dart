import 'package:flutter_application_1/404/bloc/features/login/model/login_model.dart';
import 'package:flutter_application_1/404/bloc/features/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService)
      : _loginService = loginService,
        super(const LoginState());
  final ILoginService _loginService;

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(isLoading: true, model: LoginModel(email, password)));
    final response = await _loginService.login(state.model!);
    emit(state.copyWith(isLoading: false,isComplated: response?.data != null));
    
  }
}
