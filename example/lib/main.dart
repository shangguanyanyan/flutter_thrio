import 'dart:async';

import 'package:flutter_thrio/flutter_thrio.dart';

import 'src/app.dart' as app;

Future<void> main() async {
  ThrioLogger.v('main');
  runZonedGuarded(app.main, (error, stack) {
    Zone.current.handleUncaughtError(error, stack);
  });
}

@pragma('vm:entry-point')
Future<void> biz1() async {
  runZonedGuarded(app.biz1, (error, stack) {
    Zone.current.handleUncaughtError(error, stack);
  });
}

@pragma('vm:entry-point')
Future<void> biz2() async {
  runZonedGuarded(app.biz2, (error, stack) {
    Zone.current.handleUncaughtError(error, stack);
  });
}
