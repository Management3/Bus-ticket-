import 'package:ezy_transport/routes/app_router.dart';
import 'package:ezy_transport/routes/my_route_observer.dart';
import 'package:flutter/material.dart';
//import "package:device_preview/device_preview.dart"

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    EzyTransport(),
  );
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
