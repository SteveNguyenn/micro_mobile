package com.example.yody_micro_android

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class ProfileActivity : FlutterActivity() {
    companion object {
        fun withNewEngine(): NewEngineIntentBuilder {
            return NewEngineIntentBuilder(ProfileActivity::class.java)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "profile")
            .setMethodCallHandler { call, result ->
                if (call.method == "close") {
                    this.finish()
                }
                if (call.method == "result") {
                    val arguments = call.arguments as Map<*, *>
                    val intent = Intent()
                    intent.putExtra("result", arguments.get("result") as Int)
                    setResult(101, intent)
                    this.finish()
                }
            }
    }
}