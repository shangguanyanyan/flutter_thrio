package io.flutter.embedding.engine

import android.content.Context
import io.flutter.embedding.engine.loader.FlutterLoader

open class FlutterEngineWrapper(
    context: Context,
    flutterLoader: FlutterLoader?,
    flutterJNI: FlutterJNI?
) : FlutterEngine(context, flutterLoader, flutterJNI!!)