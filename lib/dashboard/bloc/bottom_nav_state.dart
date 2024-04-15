part of 'bottom_nav_bloc.dart';

@freezed
class BottomNavState with _$BottomNavState {
  const factory BottomNavState.pageLoaded({required int selectedIndex}) =
      PageLoaded;
}
