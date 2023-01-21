import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/image_learn_202.dart';
import 'package:flutter_application_1/404/bloc/features/login/cubit/login_cubit.dart';
import 'package:flutter_application_1/404/bloc/features/login/cubit/login_cubit_state.dart';
import 'package:flutter_application_1/404/bloc/features/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../../../product/service/vexena_network_manager.dart';

part 'login_view.g.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _loginText = 'Login';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.red,
                    )
                  : const SizedBox();
            },
          ),
        ),
        body: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formLoginKey,
            child: Padding(
              padding: const PagePadding.all(),
              child: Column(
                children: [
                  _LoginEmailFields(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  _LoginButton(
                      formLoginKey: _formLoginKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      loginText: _loginText),
                ],
              ),
            )),
      ),
    );
  }
}



class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
}
