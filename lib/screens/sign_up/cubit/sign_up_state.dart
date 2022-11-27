part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.name = const Name.pure(),
    this.obsurePassword = true,
  });

  final Email email;
  final Name name;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;
  final bool obsurePassword;

  @override
  List<Object> get props => [email, password, confirmedPassword, status, name, obsurePassword];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
    Name? name,
    bool? obsurePassword,
  }) =>
      SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        name: name ?? this.name,
        obsurePassword: obsurePassword ?? this.obsurePassword,
      );
}
