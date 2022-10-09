// Copyright (c) 2022 bybit.
//
// Do not edit this file.
//

import 'package:flutter/widgets.dart';
import 'package:flutter_thrio/flutter_thrio.dart';

import 'home.page.dart';

class Module
    with
        ThrioModule,
        ModuleParamScheme,
        ModulePageBuilder,
        ModuleRouteObserver,
        NavigatorRouteObserver {
  factory Module() => _instance;

  Module._();

  static final _instance = Module._();

  @override
  String get key => 'home';

  @override
  void onPageBuilderSetting(final ModuleContext moduleContext) =>
      pageBuilder = (final settings) => HomePage(
            moduleContext: moduleContext,
            params: settings.params,
            url: settings.url,
            index: settings.index,
          );

  @override
  void onParamSchemeRegister(final ModuleContext moduleContext) {
    registerParamScheme('stringKeyBiz1');
  }

  @override
  void onRouteObserverRegister(final ModuleContext moduleContext) {
    registerRouteObserver(this);
  }

  @override
  void didReplace(final RouteSettings newRouteSettings, final RouteSettings oldRouteSettings) {
    debugPrint('didReplace: $newRouteSettings old: $oldRouteSettings');
  }
}
