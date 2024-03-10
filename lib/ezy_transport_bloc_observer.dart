import "package:flutter_bloc/flutter_bloc.dart";
import "package:logger/logger.dart";

final logger = Logger(printer: PrettyPrinter(methodCount: 0));

class EzyTransportBlocObserver extends BlocObserver {
  const EzyTransportBlocObserver();
  @override
  void onError(BlocBase<void> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e("Bloc: ${bloc.runtimeType}", error: error, stackTrace: stackTrace);
  }

  @override
  void onCreate(BlocBase<void> bloc) {
    super.onCreate(bloc);
    logger.t("${bloc.runtimeType} created");
  }

  @override
  void onClose(BlocBase<void> bloc) {
    super.onClose(bloc);
    logger.t("${bloc.runtimeType} disposed");
  }
}
