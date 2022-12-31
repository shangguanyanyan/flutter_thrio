// Copyright (c) 2022 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter/widgets.dart';
import 'package:flutter_thrio/flutter_thrio.dart';

import 'flutter6.page.dart';
import 'flutter6.route_action.dart';
import 'flutter6.route_custom_handler.dart';

class Module
    with
        ThrioModule,
        ModuleRouteCustomHandler,
        ModuleRouteAction,
        ModulePageBuilder {
  @override
  void onRouteCustomHandlerRegister(final ModuleContext moduleContext) =>
      on$RouteCustomHandlerRegister(moduleContext, registerRouteCustomHandler);

  @override
  void onRouteActionRegister(final ModuleContext moduleContext) {
    registerRouteAction(
        'sendEmailCode{context?,email,currentFrom?,coin?,amount?,address?,tag?}',
        <TParams, TResult>(
      final url,
      final action,
      final queryParams, {
      final params,
    }) {
      final result = onSendEmailCode(
        moduleContext,
        url,
        action,
        queryParams,
        context: getValueOrNull<BuildContext>(params, 'context'),
        email: getValue<String>(params, 'email'),
        currentFrom: getValueOrNull<int>(params, 'currentFrom'),
        coin: getValueOrNull<String>(params, 'coin'),
        amount: getValueOrNull<String>(params, 'amount'),
        address: getValueOrNull<String>(params, 'address'),
        tag: getValueOrNull<String>(params, 'tag'),
      );
      if (result is Future<TResult?>) {
        return result as Future<TResult?>;
      } else if (result is TResult) {
        return result as TResult;
      }
      return null;
    });
  }

  @override
  String get key => 'flutter6';

  @override
  void onPageBuilderSetting(final ModuleContext moduleContext) =>
      pageBuilder = (final settings) => Flutter6Page(
            moduleContext: moduleContext,
            params: settings.params,
            url: settings.url,
            index: settings.index,
          );
}