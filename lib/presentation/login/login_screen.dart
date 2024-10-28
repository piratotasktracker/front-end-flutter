import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end_flutter_tracker/bloc/login/login_cubit.dart';
import 'package:front_end_flutter_tracker/presentation/login/login_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:front_end_flutter_tracker/router.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final LoginCubit cubit;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    cubit = DependencyInjectionManager.sl<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  AppLocalizations.of(context)!.login_title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 33,
                    fontFamily: 'Onest',
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  AppLocalizations.of(context)!.login_headline,
                  textAlign: TextAlign.center,
                  style: AppTypography.titleSmall()
                ),
                const SizedBox(height: 67),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.email,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_email;
                    }
                    RegExp regExp = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                    if (!regExp.hasMatch(value)) {
                      return AppLocalizations.of(context)!.please_enter_valid_email;
                    }
                    return null;
                  },
                  controller: _emailController,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.password,
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.password_not_absent;
                    }
                    if (value.length < 3) {
                      return AppLocalizations.of(context)!.password_3_characters;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                BlocConsumer<LoginCubit, ILoginState>(
                  bloc: cubit,
                  listener: (context, state){
                    if(state is LoginErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${state.error.statusCode} ${state.error.result}")),
                      );
                    }
                    if(state is LoginSuccessState){
                      GoRouter.of(context).goNamed(AppRoutes.home);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()){
                          cubit.login(
                            email: _emailController.text, 
                            password: _passwordController.text,
                          );
                        }
                      }, 
                      child: state is LoginLoadingState 
                        ? const Center(child: CircularProgressIndicator()) 
                        : Text(AppLocalizations.of(context)!.login),
                    );
                  }
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: (){
                    GoRouter.of(context).goNamed('/aboba');
                  }, 
                  child: Text(AppLocalizations.of(context)!.forgot_password)
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

}