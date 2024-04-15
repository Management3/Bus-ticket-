part of 'bottom_nav_bloc.dart';

@freezed
class BottomNavEvent with _$BottomNavEvent {
  const factory BottomNavEvent.pageTapped({required int pageIndex}) =
      PageTapped;
}
