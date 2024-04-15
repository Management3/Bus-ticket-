import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart';
import 'package:ezy_transport/common/my_text_filled/bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:ezy_transport/dashboard/bloc/bottom_nav_bloc.dart';
import 'package:ezy_transport/onboarding/bloc/onboarding_bloc.dart';
import 'package:ezy_transport/routes/app_router.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:ezy_transport/routes/my_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "ezy_transport_bloc_observer.dart";
//import "package:device_preview/device_preview.dart"

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = const EzyTransportBlocObserver();
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  if (isFirstLaunch) {
    await prefs.setBool('isFirstLaunch', false);
  }
  runApp(
    EzyTransport(isFirstLaunch: isFirstLaunch),
  );

  FlutterNativeSplash.remove();

  // Set status bar color and icon brightness
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF0094FF),
    statusBarIconBrightness: Brightness.light,
  ));
}

class EzyTransport extends StatelessWidget {
  EzyTransport({super.key, required this.isFirstLaunch});

  final bool isFirstLaunch;
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyFormBloc(),
        ),
        BlocProvider(
          create: (context) => PasswordVisibilityBloc(),
        ),
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
      ],
      child: MaterialApp.router(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
          deepLinkBuilder: (deepLink) {
            // If it's the first launch, navigate to the onboarding screen
            if (isFirstLaunch) {
              return const DeepLink([OnboardingRoute()]);
            } else {
              //return const DeepLink([SignInRoute()]);
              return const DeepLink([OnboardingRoute()]);
            }
          },
          navigatorObservers: () => [MyRouteObserver()],
        ),
      ),
    );
  }
}
