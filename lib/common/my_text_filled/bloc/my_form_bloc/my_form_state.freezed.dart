// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyFormState {
  UsernameOrPhone get usernameOrPhone => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isPasswordObscure => throw _privateConstructorUsedError;
  bool get isConfirmPasswordObscure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyFormStateCopyWith<MyFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFormStateCopyWith<$Res> {
  factory $MyFormStateCopyWith(
          MyFormState value, $Res Function(MyFormState) then) =
      _$MyFormStateCopyWithImpl<$Res, MyFormState>;
  @useResult
  $Res call(
      {UsernameOrPhone usernameOrPhone,
      Password password,
      Password confirmPassword,
      bool isValid,
      FormzSubmissionStatus status,
      bool isPasswordObscure,
      bool isConfirmPasswordObscure});
}

/// @nodoc
class _$MyFormStateCopyWithImpl<$Res, $Val extends MyFormState>
    implements $MyFormStateCopyWith<$Res> {
  _$MyFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameOrPhone = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? isValid = null,
    Object? status = null,
    Object? isPasswordObscure = null,
    Object? isConfirmPasswordObscure = null,
  }) {
    return _then(_value.copyWith(
      usernameOrPhone: null == usernameOrPhone
          ? _value.usernameOrPhone
          : usernameOrPhone // ignore: cast_nullable_to_non_nullable
              as UsernameOrPhone,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isPasswordObscure: null == isPasswordObscure
          ? _value.isPasswordObscure
          : isPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: null == isConfirmPasswordObscure
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyFormStateImplCopyWith<$Res>
    implements $MyFormStateCopyWith<$Res> {
  factory _$$MyFormStateImplCopyWith(
          _$MyFormStateImpl value, $Res Function(_$MyFormStateImpl) then) =
      __$$MyFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsernameOrPhone usernameOrPhone,
      Password password,
      Password confirmPassword,
      bool isValid,
      FormzSubmissionStatus status,
      bool isPasswordObscure,
      bool isConfirmPasswordObscure});
}

/// @nodoc
class __$$MyFormStateImplCopyWithImpl<$Res>
    extends _$MyFormStateCopyWithImpl<$Res, _$MyFormStateImpl>
    implements _$$MyFormStateImplCopyWith<$Res> {
  __$$MyFormStateImplCopyWithImpl(
      _$MyFormStateImpl _value, $Res Function(_$MyFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameOrPhone = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? isValid = null,
    Object? status = null,
    Object? isPasswordObscure = null,
    Object? isConfirmPasswordObscure = null,
  }) {
    return _then(_$MyFormStateImpl(
      usernameOrPhone: null == usernameOrPhone
          ? _value.usernameOrPhone
          : usernameOrPhone // ignore: cast_nullable_to_non_nullable
              as UsernameOrPhone,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isPasswordObscure: null == isPasswordObscure
          ? _value.isPasswordObscure
          : isPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: null == isConfirmPasswordObscure
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MyFormStateImpl implements _MyFormState {
  const _$MyFormStateImpl(
      {this.usernameOrPhone = const UsernameOrPhone.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const Password.pure(),
      this.isValid = false,
      this.status = FormzSubmissionStatus.initial,
      this.isPasswordObscure = true,
      this.isConfirmPasswordObscure = true});

  @override
  @JsonKey()
  final UsernameOrPhone usernameOrPhone;
  @override
  @JsonKey()
  final Password password;
  @override
  @JsonKey()
  final Password confirmPassword;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isPasswordObscure;
  @override
  @JsonKey()
  final bool isConfirmPasswordObscure;

  @override
  String toString() {
    return 'MyFormState(usernameOrPhone: $usernameOrPhone, password: $password, confirmPassword: $confirmPassword, isValid: $isValid, status: $status, isPasswordObscure: $isPasswordObscure, isConfirmPasswordObscure: $isConfirmPasswordObscure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFormStateImpl &&
            (identical(other.usernameOrPhone, usernameOrPhone) ||
                other.usernameOrPhone == usernameOrPhone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPasswordObscure, isPasswordObscure) ||
                other.isPasswordObscure == isPasswordObscure) &&
            (identical(
                    other.isConfirmPasswordObscure, isConfirmPasswordObscure) ||
                other.isConfirmPasswordObscure == isConfirmPasswordObscure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      usernameOrPhone,
      password,
      confirmPassword,
      isValid,
      status,
      isPasswordObscure,
      isConfirmPasswordObscure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyFormStateImplCopyWith<_$MyFormStateImpl> get copyWith =>
      __$$MyFormStateImplCopyWithImpl<_$MyFormStateImpl>(this, _$identity);
}

abstract class _MyFormState implements MyFormState {
  const factory _MyFormState(
      {final UsernameOrPhone usernameOrPhone,
      final Password password,
      final Password confirmPassword,
      final bool isValid,
      final FormzSubmissionStatus status,
      final bool isPasswordObscure,
      final bool isConfirmPasswordObscure}) = _$MyFormStateImpl;

  @override
  UsernameOrPhone get usernameOrPhone;
  @override
  Password get password;
  @override
  Password get confirmPassword;
  @override
  bool get isValid;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isPasswordObscure;
  @override
  bool get isConfirmPasswordObscure;
  @override
  @JsonKey(ignore: true)
  _$$MyFormStateImplCopyWith<_$MyFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
