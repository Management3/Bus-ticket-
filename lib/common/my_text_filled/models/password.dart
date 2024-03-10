import "package:formz/formz.dart";

enum PasswordValidationError { invalid }

final class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = ""]) : super.pure();
  const Password.dirty([super.value = ""]) : super.dirty();

  static final _passwordRegex =
      RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})");

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? "")
        ? null
        : PasswordValidationError.invalid;
  }
}
