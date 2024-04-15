// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:ezy_transport/booked_tickets/view/booked_tickets_page.dart'
    as _i1;
import 'package:ezy_transport/booking_page/view/booking_page.dart' as _i2;
import 'package:ezy_transport/booking_page/view/payment_page.dart' as _i6;
import 'package:ezy_transport/dashboard/view/dashboard_page.dart' as _i3;
import 'package:ezy_transport/onboarding/view/onboarding_page.dart' as _i5;
import 'package:ezy_transport/sign_in/view/sign_in_page.dart' as _i7;
import 'package:ezy_transport/sign_up/view/enter_otp_page.dart' as _i4;
import 'package:ezy_transport/sign_up/view/sign_up_page.dart' as _i8;
import 'package:ezy_transport/sign_up/view/verify_number_page.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    BookedTicketsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookedTicketsPage(),
      );
    },
    BookingRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BookingPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    EnterOTPRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EnterOTPPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingPage(),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PaymentPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpPage(),
      );
    },
    VerifyNumberRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.VerifyNumberPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookedTicketsPage]
class BookedTicketsRoute extends _i10.PageRouteInfo<void> {
  const BookedTicketsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          BookedTicketsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookedTicketsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BookingPage]
class BookingRoute extends _i10.PageRouteInfo<void> {
  const BookingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EnterOTPPage]
class EnterOTPRoute extends _i10.PageRouteInfo<void> {
  const EnterOTPRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EnterOTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterOTPRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PaymentPage]
class PaymentRoute extends _i10.PageRouteInfo<void> {
  const PaymentRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignInPage]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpPage]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.VerifyNumberPage]
class VerifyNumberRoute extends _i10.PageRouteInfo<void> {
  const VerifyNumberRoute({List<_i10.PageRouteInfo>? children})
      : super(
          VerifyNumberRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyNumberRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
