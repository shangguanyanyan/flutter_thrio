// Copyright (c) 2023 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

import 'flutter7.page.dart';

class Module with ThrioModule, ModulePageBuilder {
  @override
  String get key => 'flutter7';

  @override
  void onPageBuilderSetting(ModuleContext moduleContext) =>
      pageBuilder = (settings) => Flutter7Page(
            moduleContext: moduleContext,
            settings: settings,
          );
}
