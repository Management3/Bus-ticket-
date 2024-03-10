part of "password_visibility_bloc.dart";

@immutable
abstract class PasswordVisibilityState {}

class PasswordVisible extends PasswordVisibilityState {}

class PasswordHidden extends PasswordVisibilityState {}
