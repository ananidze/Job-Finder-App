// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:jobspot/screens/sign_up/sign_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          print(state);
          Navigator.of(context).pushNamed('/home');
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, 1 / 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Create an Account", style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 16.0),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const _NameInput(),
            const SizedBox(height: 10),
            _EmailInput(),
            const SizedBox(height: 10),
            _PasswordInput(),
            const SizedBox(height: 10),
            _ConfirmPasswordInput(),
            const SizedBox(height: 30),
            _SignUpButton(),
            const SizedBox(height: 10),
            _GoogleLoginButton(),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Full Name"),
        const SizedBox(height: 5),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) => TextField(
            onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
            decoration: InputDecoration(
              hintText: 'John Doe',
              errorText: state.name.invalid ? 'invalid name' : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email"),
        const SizedBox(height: 5),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) => TextField(
            onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'example@mail.com',
              errorText: state.email.invalid ? 'invalid email' : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      // buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password'),
          const SizedBox(height: 5),
          TextField(
            onChanged: (password) => context.read<SignUpCubit>().passwordChanged(password),
            obscureText: state.obsurePassword,
            decoration: InputDecoration(
              hintText: '********',
              suffixIcon: TextButton(
                child: const Icon(Icons.hide_source_rounded),
                onPressed: () => context.read<SignUpCubit>().togglePasswordVisibility(),
              ),
              errorText: state.password.invalid ? 'invalid password' : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Confirm Password'),
        const SizedBox(height: 5),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return TextField(
              onChanged: (confirmPassword) =>
                  context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
              obscureText: state.obsurePassword,
              decoration: InputDecoration(
                hintText: '********',
                suffixIcon: TextButton(
                  child: const Icon(Icons.hide_source_rounded),
                  onPressed: () => context.read<SignUpCubit>().togglePasswordVisibility(),
                ),
                errorText: state.confirmedPassword.invalid ? 'passwords do not match' : null,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.status.isValidated
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                child: const Text('SIGN UP'),
              );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: const Text('SIGN UP WITH GOOGLE'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      icon: const Icon(Icons.g_translate, color: Colors.white),
      onPressed: () => {},
      // onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}
