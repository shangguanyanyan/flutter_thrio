// The MIT License (MIT)
//
// Copyright (c) 2019 Hellobike Group
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

// ignore_for_file: avoid_as

import 'package:flutter/widgets.dart';

final _isBuiltOf = <RouteSettings, bool>{};

final _isPushedOf = <RouteSettings, bool>{};

final _isSelectedOf = <RouteSettings, bool?>{};

final _urlOf = <RouteSettings, String?>{};

final _indexOf = <RouteSettings, int?>{};

extension NavigatorRouteSettings on RouteSettings {
  static int _fakeIndex = 0x7fffffff;

  static RouteSettings get nullSettings => const RouteSettings(name: '');

  /// Construct RouteSettings with url, index, params.
  ///
  static RouteSettings settingsWith({
    required String url,
    int? index = 0,
    dynamic params,
  }) {
    final idx = index ?? _fakeIndex--;
    return RouteSettings(
      name: '$idx $url',
      arguments: <String, dynamic>{'params': params},
    );
  }

  /// Converting arguments to route settings.
  ///
  static RouteSettings? fromArguments(Map<String, dynamic>? arguments) {
    if ((arguments != null && arguments.isNotEmpty) &&
        arguments.containsKey('url') &&
        arguments.containsKey('index')) {
      final urlValue = arguments['url'];
      final url = urlValue is String ? urlValue : null;
      final indexValue = arguments['index'];
      final index = indexValue is int ? indexValue : null;
      final isNested = arguments['isNested'] == true;
      final animated = arguments['animated'] == true;
      final params = arguments['params'];
      final fromURLValue = arguments['fromURL'];
      final fromURL = fromURLValue is String ? fromURLValue : null;
      final prevURLValue = arguments['prevURL'];
      final prevURL = prevURLValue is String ? prevURLValue : null;
      final innerURLValue = arguments['innerURL'];
      final innerURL = innerURLValue is String ? innerURLValue : null;
      final args = <String, dynamic>{
        'isNested': isNested,
        'animated': animated,
      };
      if (params != null) {
        args['params'] = params;
      }
      if (fromURL?.isNotEmpty == true) {
        args['fromURL'] = fromURL;
      }
      if (prevURL?.isNotEmpty == true) {
        args['prevURL'] = prevURL;
      }
      if (innerURL?.isNotEmpty == true) {
        args['innerURL'] = innerURL;
      }
      return RouteSettings(
        name: '$index $url',
        arguments: args,
      );
    }
    return null;
  }

  static RouteSettings? fromNewUrlArguments(
    final Map<String, dynamic>? arguments,
  ) {
    if ((arguments != null && arguments.isNotEmpty) &&
        arguments.containsKey('newUrl') &&
        arguments.containsKey('newIndex')) {
      final urlValue = arguments['newUrl'];
      final url = urlValue is String ? urlValue : null;
      final indexValue = arguments['newIndex'];
      final index = indexValue is int ? indexValue : null;
      final isNested = arguments['isNested'] == true;
      final animated = arguments['animated'] == true;
      return RouteSettings(name: '$index $url', arguments: <String, dynamic>{
        'isNested': isNested,
        'animated': animated,
      });
    }
    return null;
  }

  Map<String, dynamic> toArgumentsWithoutParams() {
    final args = <String, dynamic>{
      'url': url,
      'index': index,
      'isNested': isNested,
      'animated': animated,
    };
    if (fromURL?.isNotEmpty == true) {
      args['fromURL'] = fromURL;
    }
    if (prevURL?.isNotEmpty == true) {
      args['prevURL'] = prevURL;
    }
    if (innerURL?.isNotEmpty == true) {
      args['innerURL'] = innerURL;
    }
    return args;
  }

  /// Indicates whether this route is generated by build
  ///
  bool get isBuilt => _isBuiltOf[name!] ?? false;

  set isBuilt(bool built) {
    _isBuiltOf[this] = built;
  }

  /// Indicates whether this route is generated by push
  ///
  bool get isPushed => _isPushedOf[name!] ?? false;

  set isPushed(bool pushed) {
    _isPushedOf[this] = pushed;
  }

  /// Indicates whether the route is selected in the NavigatorPageView
  ///
  bool? get isSelected {
    if (!isBuilt) {
      return null;
    }
    return _isSelectedOf[name!];
  }

  set isSelected(bool? selected) {
    _isSelectedOf[this] = selected;
  }

  String get url {
    if (_urlOf[this] == null) {
      var u = '';
      final settingsName = name;
      if (settingsName != null &&
          settingsName.isNotEmpty &&
          settingsName.contains(' ')) {
        u = settingsName.split(' ').last;
        // 补充 / 使其成为正常的 url
        if (!u.startsWith('/')) {
          _urlOf[this] = '/$u';
        } else {
          _urlOf[this] = u;
        }
      }
    }
    return _urlOf[this]!;
  }

  int get index {
    if (_indexOf[this] == null) {
      final settingsName = name;
      _indexOf[this] = settingsName == null ||
              settingsName.isEmpty ||
              !settingsName.contains(' ')
          ? 0
          : int.tryParse(settingsName.split(' ').first) ?? 0;
    }
    return _indexOf[this]!;
  }

  bool get isNested {
    final args = arguments;
    if (args != null && args is Map) {
      return args['isNested'] == true;
    }
    return false;
  }

  bool get animated {
    final args = arguments;
    if (args != null && args is Map) {
      return args['animated'] == true;
    }
    return false;
  }

  dynamic get params {
    final args = arguments;
    if (args != null && args is Map) {
      return args['params'];
    }
    return null;
  }

  set params(dynamic value) {
    final args = arguments;
    if (args != null && args is Map) {
      args['params'] = value;
    }
  }

  String? get fromURL {
    final args = arguments;
    if (args != null && args is Map) {
      return args['fromURL'] as String?;
    }
    return null;
  }

  String? get prevURL {
    final args = arguments;
    if (args != null && args is Map) {
      return args['prevURL'] as String?;
    }
    return null;
  }

  set prevURL(String? value) {
    final args = arguments;
    if (args != null && args is Map) {
      args['prevURL'] = value;
    }
  }

  String? get innerURL {
    final args = arguments;
    if (args != null && args is Map) {
      return args['innerURL'] as String?;
    }
    return null;
  }
}
