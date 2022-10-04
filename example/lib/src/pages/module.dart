// Copyright (c) 2022 bybit.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

import 'biz1/module.dart' as biz1;
import 'biz2/module.dart' as biz2;

import 'types/people.dart';
import 'types/user_profile.dart';

class Module
    with
        ThrioModule,
        ModuleJsonDeserializer,
        ModuleJsonSerializer,
        ModuleParamScheme {
  factory Module() => _instance;

  Module._();

  static final _instance = Module._();

  @override
  void onModuleRegister(final ModuleContext moduleContext) {
    registerModule(biz1.Module(), moduleContext);
    registerModule(biz2.Module(), moduleContext);
  }

  @override
  void onParamSchemeRegister(final ModuleContext moduleContext) {
    registerParamScheme('intKeyRootModule');
  }

  @override
  void onJsonSerializerRegister(final ModuleContext moduleContext) {
    registerJsonSerializer<People>((final i) => i<People>().toMap());
    registerJsonSerializer<UserProfile>((final i) => i<UserProfile>().toMap());
  }

  @override
  void onJsonDeserializerRegister(final ModuleContext moduleContext) {
    registerJsonDeserializer(People.fromMap);
    registerJsonDeserializer(UserProfile.fromMap);
  }
}
