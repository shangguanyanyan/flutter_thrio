// Copyright (c) 2024 foxsofter.
//
// Do not edit this file.
//
// ignore_for_file: avoid_as

import 'package:flutter_thrio/flutter_thrio.dart';

typedef LogoutNotifyCallback = void Function();

class LogoutNotify extends NavigatorPageNotify {
  LogoutNotify({
    super.key,
    required final LogoutNotifyCallback onNotify,
    required super.child,
  }) : super(
          name: 'logout',
          onPageNotify: (_) => onNotify(),
        );
}
