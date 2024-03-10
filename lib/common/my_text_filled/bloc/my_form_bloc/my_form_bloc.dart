import "dart:async";

import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart";
import "package:ezy_transport/common/my_text_filled/models/models.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:formz/formz.dart";

class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  MyFormBloc() : super(const MyFormState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInEmailUnfocused>(_onSignInEmailUnfocused);
    on<SignInPasswordUnfocused>(_onSignInPasswordUnfocused);
    on<SignUpEmailUnfocused>(_onSignUpEmailUnfocused);
    on<SignUpPasswordUnfocused>(_onSignUpPasswordUnfocused);
    on<FormSubmitted>(_onFormSubmitted);
    on<PasswordObscureChanged>(_onPasswordObscureChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ConfirmPasswordUnfocused>(_onConfirmPasswordUnfocused);
    on<ConfirmPasswordObscureChanged>(_onConfirmPasswordObscureChanged);
  }

  FutureOr<void> _onEmailChanged(
    EmailChanged event,
    Emitter<MyFormState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.isValid ? email : Email.pure(event.email),
        isValid: Formz.validate([email, state.password, state.confirmPassword]),
      ),
    );
  }

  FutureOr<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<MyFormState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password.isValid ? password : Password.pure(event.password),
        isValid: Formz.validate(
          [state.email, password, state.confirmPassword],
        ),
      ),
    );
  }

  FutureOr<void> _onSignInEmailUnfocused(
    SignInEmailUnfocused event,
    Emitter<MyFormState> emit,
  ) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  FutureOr<void> _onSignUpEmailUnfocused(
    SignUpEmailUnfocused event,
    Emitter<MyFormState> emit,
  ) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  FutureOr<void> _onSignInPasswordUnfocused(
    SignInPasswordUnfocused event,
    Emitter<MyFormState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  FutureOr<void> _onSignUpPasswordUnfocused(
    SignUpPasswordUnfocused event,
    Emitter<MyFormState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  FutureOr<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<MyFormState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: Formz.validate([email, password, state.confirmPassword]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }

  FutureOr<void> _onPasswordObscureChanged(
    PasswordObscureChanged event,
    Emitter<MyFormState> emit,
  ) {
    emit(
      state.copyWith(
        isPasswordObscure: !state.isPasswordObscure,
      ),
    );
  }

  FutureOr<void> _onConfirmPasswordObscureChanged(
    ConfirmPasswordObscureChanged event,
    Emitter<MyFormState> emit,
  ) {
    emit(
      state.copyWith(
        isConfirmPasswordObscure: !state.isConfirmPasswordObscure,
      ),
    );
  }

  Future<void> _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<MyFormState> emit,
  ) async {
    final confirmPassword = Password.dirty(event.confirmPassword);
    final password = state.password;

    emit(
      state.copyWith(
        confirmPassword: confirmPassword.isValid
            ? confirmPassword
            : Password.pure(event.confirmPassword),
        isValid: confirmPassword.value == password.value &&
            confirmPassword.isValid &&
            password.isValid &&
            state.email.isValid,
      ),
    );
  }

  Future<void> _onConfirmPasswordUnfocused(
    ConfirmPasswordUnfocused event,
    Emitter<MyFormState> emit,
  ) async {
    final confirmPassword = Password.dirty(state.confirmPassword.value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate(
          [state.email, state.password, confirmPassword],
        ),
      ),
    );
  }
}
