import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_bloc.freezed.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState.pageLoaded(selectedIndex: 0)) {
    on<BottomNavEvent>((event, emit) {
      event.map(
        pageTapped: (e) =>
            emit(BottomNavState.pageLoaded(selectedIndex: e.pageIndex)),
      );
    });
  }
}
