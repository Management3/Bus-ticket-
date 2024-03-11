import "package:ezy_transport/common/my_text_filled/models/models.dart";
import "package:formz/formz.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "my_form_state.freezed.dart";

@freezed
abstract class MyFormState with _$MyFormState {
  const factory MyFormState({
    @Default(UsernameOrPhone.pure()) UsernameOrPhone usernameOrPhone,
    @Default(Password.pure()) Password password,
    @Default(Password.pure()) Password confirmPassword,
    @Default(false) bool isValid,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(true) bool isPasswordObscure,
    @Default(true) bool isConfirmPasswordObscure,
  }) = _MyFormState;

  factory MyFormState.initial() => const MyFormState();
}
