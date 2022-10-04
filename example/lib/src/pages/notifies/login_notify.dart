// Copyright (c) 2022 bybit.
//
// Do not edit this file.
//
// ignore_for_file: avoid_as

import 'package:flutter_thrio/flutter_thrio.dart';

typedef LoginNotifyCallback = void Function({
  int? uid,
  String userName,
  String userToken,
});

class LoginNotify extends NavigatorPageNotify {
  LoginNotify({
    final super.key,
    required final LoginNotifyCallback onNotify,
    final int? uid,
    final String? userName,
    final String? userToken,
    required final super.child,
  }) : super(
            name: 'login',
            onPageNotify: (final params) => onNotify(
                uid: params['uid'] as int?,
                userName: params['userName'] as String,
                userToken: params['userToken'] as String),
            initialParams: uid == null && userName == null && userToken == null
                ? null
                : {'uid': uid, 'userName': userName, 'userToken': userToken});
}
