// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomNavEvent {
  int get pageIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageIndex) pageTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageIndex)? pageTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageIndex)? pageTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTapped value) pageTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTapped value)? pageTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTapped value)? pageTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavEventCopyWith<BottomNavEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavEventCopyWith<$Res> {
  factory $BottomNavEventCopyWith(
          BottomNavEvent value, $Res Function(BottomNavEvent) then) =
      _$BottomNavEventCopyWithImpl<$Res, BottomNavEvent>;
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class _$BottomNavEventCopyWithImpl<$Res, $Val extends BottomNavEvent>
    implements $BottomNavEventCopyWith<$Res> {
  _$BottomNavEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageTappedImplCopyWith<$Res>
    implements $BottomNavEventCopyWith<$Res> {
  factory _$$PageTappedImplCopyWith(
          _$PageTappedImpl value, $Res Function(_$PageTappedImpl) then) =
      __$$PageTappedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class __$$PageTappedImplCopyWithImpl<$Res>
    extends _$BottomNavEventCopyWithImpl<$Res, _$PageTappedImpl>
    implements _$$PageTappedImplCopyWith<$Res> {
  __$$PageTappedImplCopyWithImpl(
      _$PageTappedImpl _value, $Res Function(_$PageTappedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_$PageTappedImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PageTappedImpl implements PageTapped {
  const _$PageTappedImpl({required this.pageIndex});

  @override
  final int pageIndex;

  @override
  String toString() {
    return 'BottomNavEvent.pageTapped(pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageTappedImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageTappedImplCopyWith<_$PageTappedImpl> get copyWith =>
      __$$PageTappedImplCopyWithImpl<_$PageTappedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageIndex) pageTapped,
  }) {
    return pageTapped(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageIndex)? pageTapped,
  }) {
    return pageTapped?.call(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageIndex)? pageTapped,
    required TResult orElse(),
  }) {
    if (pageTapped != null) {
      return pageTapped(pageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageTapped value) pageTapped,
  }) {
    return pageTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageTapped value)? pageTapped,
  }) {
    return pageTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageTapped value)? pageTapped,
    required TResult orElse(),
  }) {
    if (pageTapped != null) {
      return pageTapped(this);
    }
    return orElse();
  }
}

abstract class PageTapped implements BottomNavEvent {
  const factory PageTapped({required final int pageIndex}) = _$PageTappedImpl;

  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$PageTappedImplCopyWith<_$PageTappedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomNavState {
  int get selectedIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int selectedIndex) pageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int selectedIndex)? pageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int selectedIndex)? pageLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageLoaded value) pageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageLoaded value)? pageLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageLoaded value)? pageLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavStateCopyWith<BottomNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavStateCopyWith<$Res> {
  factory $BottomNavStateCopyWith(
          BottomNavState value, $Res Function(BottomNavState) then) =
      _$BottomNavStateCopyWithImpl<$Res, BottomNavState>;
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class _$BottomNavStateCopyWithImpl<$Res, $Val extends BottomNavState>
    implements $BottomNavStateCopyWith<$Res> {
  _$BottomNavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageLoadedImplCopyWith<$Res>
    implements $BottomNavStateCopyWith<$Res> {
  factory _$$PageLoadedImplCopyWith(
          _$PageLoadedImpl value, $Res Function(_$PageLoadedImpl) then) =
      __$$PageLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class __$$PageLoadedImplCopyWithImpl<$Res>
    extends _$BottomNavStateCopyWithImpl<$Res, _$PageLoadedImpl>
    implements _$$PageLoadedImplCopyWith<$Res> {
  __$$PageLoadedImplCopyWithImpl(
      _$PageLoadedImpl _value, $Res Function(_$PageLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_$PageLoadedImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PageLoadedImpl implements PageLoaded {
  const _$PageLoadedImpl({required this.selectedIndex});

  @override
  final int selectedIndex;

  @override
  String toString() {
    return 'BottomNavState.pageLoaded(selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageLoadedImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageLoadedImplCopyWith<_$PageLoadedImpl> get copyWith =>
      __$$PageLoadedImplCopyWithImpl<_$PageLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int selectedIndex) pageLoaded,
  }) {
    return pageLoaded(selectedIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int selectedIndex)? pageLoaded,
  }) {
    return pageLoaded?.call(selectedIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int selectedIndex)? pageLoaded,
    required TResult orElse(),
  }) {
    if (pageLoaded != null) {
      return pageLoaded(selectedIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PageLoaded value) pageLoaded,
  }) {
    return pageLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PageLoaded value)? pageLoaded,
  }) {
    return pageLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PageLoaded value)? pageLoaded,
    required TResult orElse(),
  }) {
    if (pageLoaded != null) {
      return pageLoaded(this);
    }
    return orElse();
  }
}

abstract class PageLoaded implements BottomNavState {
  const factory PageLoaded({required final int selectedIndex}) =
      _$PageLoadedImpl;

  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$PageLoadedImplCopyWith<_$PageLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
