import 'dart:async';

import 'package:ezy_transport/routes/app_router.dart';
import 'package:ezy_transport/routes/my_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import "package:device_preview/device_preview.dart"

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
    return MaterialApp.router(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: "OpenSans",
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [MyRouteObserver()],
      ),
    );
  }
}
