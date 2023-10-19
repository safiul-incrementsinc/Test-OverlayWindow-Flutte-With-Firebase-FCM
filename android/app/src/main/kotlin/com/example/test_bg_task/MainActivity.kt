package com.example.test_bg_task

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "custom_channel_for_me"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "printSomething" -> {
                    result.success("jbjbjff")
                }

                else -> {}
            }
        }
    }
}

