import 'dart:async';

import 'package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart';
import 'package:ezy_transport/common/my_text_filled/bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:ezy_transport/routes/app_router.dart';
import 'package:ezy_transport/routes/my_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import "ezy_transport_bloc_observer.dart";
//import "package:device_preview/device_preview.dart"

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = const EzyTransportBlocObserver();
  runApp(
    EzyTransport(),
  );
  Timer(const Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });
}

class EzyTransport extends StatelessWidget {
  EzyTransport({super.key});

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
      ],
      child: MaterialApp.router(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [MyRouteObserver()],
        ),
      ),
    );
  }
}
