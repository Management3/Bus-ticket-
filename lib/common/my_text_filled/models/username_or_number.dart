import "package:formz/formz.dart";

enum UsernameOrNumberValidationError { invalid }

final class UsernameOrPhone
    extends FormzInput<String, UsernameOrNumberValidationError> {
  const UsernameOrPhone.pure([super.value = ""]) : super.pure();
  const UsernameOrPhone.dirty([super.value = ""]) : super.dirty();

  static final _numberRegex = RegExp(
    r"^(?:[a-zA-Z]{3,15}|[0-9]{10})$",
  );

  @override
  UsernameOrNumberValidationError? validator(String? value) {
    return _numberRegex.hasMatch(value ?? "")
        ? null
        : UsernameOrNumberValidationError.invalid;
  }
}
