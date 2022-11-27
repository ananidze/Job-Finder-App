// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:jobspot/constants/colors.dart';

import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        } else if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Welcome Back", style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 16.0),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            _EmailInput(),
            const SizedBox(height: 15),
            _PasswordInput(),
            const SizedBox(height: 10),
            const RememberMe(),
            const SizedBox(height: 15),
            _LoginButton(),
            const SizedBox(height: 10),
            _GoogleLoginButton(),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/signup'),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email'),
          const SizedBox(height: 10),
          TextField(
            onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'example@gmail.com',
              errorText: state.email.invalid ? 'invalid email' : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password'),
          const SizedBox(height: 10),
          TextField(
            onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
            obscureText: state.obscurePassword,
            decoration: InputDecoration(
              hintText: '********',
              suffixIcon: TextButton(
                child: const Icon(Icons.hide_source_rounded),
                onPressed: () => context.read<LoginCubit>().togglePasswordVisibility(),
              ),
              errorText: state.password.invalid ? 'invalid password' : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      // buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) => state.status.isSubmissionInProgress
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: state.status.isValidated
                  ? () => context.read<LoginCubit>().logInWithCredentials()
                  : null,
              child: const Text('LOGIN'),
            ),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: const Text('SIGN IN WITH GOOGLE'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      icon: const Icon(Icons.g_translate, color: Colors.white),
      onPressed: () => {}, // onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}

class RememberMe extends StatelessWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: state.rememberMe,
              onChanged: (onChanged) => context.read<LoginCubit>().toggleRememberMe(),
              checkColor: AppColors.primary,
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => {},
              child: const Text("Forgot Password?"),
            ),
          ],
        );
      },
    );
  }
}
