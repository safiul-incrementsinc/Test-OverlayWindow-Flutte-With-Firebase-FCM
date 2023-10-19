package com.example.verygoodcore

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class MyFlutterPluginPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var context: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "my_flutter_plugin_android")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformName") {
            val fibonacciSeries = generateFibonacciSeries(40)
            result.success(fibonacciSeries.toString())
        } else {
            result.notImplemented()
        }
    }

    fun generateFibonacciSeries(terms: Int): List<Int> {
        val fibonacciSeries = mutableListOf<Int>()
        for (i in 0 until terms) {
            fibonacciSeries.add(fibonacci(i))
        }
        return fibonacciSeries
    }

    fun fibonacci(n: Int): Int {
        return if (n <= 1) {
            n
        } else {
            fibonacci(n - 1) + fibonacci(n - 2)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        context = null
    }
}