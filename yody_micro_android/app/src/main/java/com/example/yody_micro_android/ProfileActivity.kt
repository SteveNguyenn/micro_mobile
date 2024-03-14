package com.example.yody_micro_android

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class ProfileActivity : FlutterActivity() {
    companion object {

        fun withCachedEngine(cachedEngineId: String): FlutterActivity.CachedEngineIntentBuilder {
            return FlutterActivity.CachedEngineIntentBuilder(
                ProfileActivity::class.java,
                cachedEngineId
            )
        }

        fun withNewEngine(): FlutterActivity.NewEngineIntentBuilder {
            return FlutterActivity.NewEngineIntentBuilder(ProfileActivity::class.java)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "profile")
            .setMethodCallHandler { call, result ->
                if (call.method == "close") {
                    this.finish()
                }
            }
    }
}