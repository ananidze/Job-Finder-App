import 'package:formz/formz.dart';

enum NameInputError { invalid }

class Name extends FormzInput<String, NameInputError> {
  const Name.pure() : super.pure('');

  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameInputError? validator(String name) {
    return name.isEmpty || name.length < 4 ? NameInputError.invalid : null;
  }
}
