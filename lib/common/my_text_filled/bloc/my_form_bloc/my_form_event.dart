import "package:freezed_annotation/freezed_annotation.dart";

part "my_form_event.freezed.dart";

@freezed
abstract class MyFormEvent with _$MyFormEvent {
  const factory MyFormEvent.emailChanged({
    required String email,
  }) = EmailChanged;

  const factory MyFormEvent.signInEmailUnfocused() = SignInEmailUnfocused;

  const factory MyFormEvent.signUpEmailUnfocused() = SignUpEmailUnfocused;

  const factory MyFormEvent.passwordChanged({required String password}) =
      PasswordChanged;

  const factory MyFormEvent.confirmPasswordChanged({
    required String confirmPassword,
  }) = ConfirmPasswordChanged;

  const factory MyFormEvent.signInPasswordUnfocused() = SignInPasswordUnfocused;

  const factory MyFormEvent.signUpPasswordUnfocused() = SignUpPasswordUnfocused;

  const factory MyFormEvent.formSubmitted() = FormSubmitted;

  const factory MyFormEvent.passwordObscureChanged() = PasswordObscureChanged;

  const factory MyFormEvent.confirmPasswordUnfocused() =
      ConfirmPasswordUnfocused;

  const factory MyFormEvent.confirmPasswordObscureChanged() =
      ConfirmPasswordObscureChanged;
}
