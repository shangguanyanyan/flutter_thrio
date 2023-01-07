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

import 'package:flutter/widgets.dart';

import 'navigator_page_lifecycle_mixin.dart';
import 'navigator_types.dart';

class NavigatorPageLifecycle extends StatefulWidget {
  const NavigatorPageLifecycle({
    super.key,
    this.didAppear,
    this.didDisappear,
    required this.child,
  });

  final NavigatorPageObserverCallback? didAppear;
  final NavigatorPageObserverCallback? didDisappear;
  final Widget child;

  @override
  _NavigatorPageLifecycleState createState() => _NavigatorPageLifecycleState();
}

class _NavigatorPageLifecycleState extends State<NavigatorPageLifecycle>
    with NavigatorPageLifecycleMixin {
  @override
  Widget build(final BuildContext context) => widget.child;

  @override
  void didAppear(final RouteSettings settings) {
    widget.didAppear?.call(settings);
  }

  @override
  void didDisappear(final RouteSettings settings) {
    widget.didDisappear?.call(settings);
  }
}
