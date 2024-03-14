package com.example.yody_micro_android

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class LoginActivity : FlutterActivity() {
    companion object {

        fun withCachedEngine(cachedEngineId: String): CachedEngineIntentBuilder {
            return CachedEngineIntentBuilder(LoginActivity::class.java, cachedEngineId)
        }

        fun withNewEngine(): NewEngineIntentBuilder {
            return NewEngineIntentBuilder(LoginActivity::class.java)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "login")
            .setMethodCallHandler { call, result ->
                if (call.method == "close") {
                    this.finish()
                }
            }
    }
}