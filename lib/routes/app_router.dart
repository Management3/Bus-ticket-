import "package:auto_route/auto_route.dart";
import "package:ezy_transport/routes/app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, initial: true),
      ];
}
