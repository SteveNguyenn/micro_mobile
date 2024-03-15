package com.example.yody_micro_android

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class LoginActivity : FlutterActivity() {

    private var loginChannel : MethodChannel? = null
    companion object {
        fun withNewEngine(): NewEngineIntentBuilder {
            return NewEngineIntentBuilder(LoginActivity::class.java)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        loginChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "login")
        loginChannel?.setMethodCallHandler { call, result ->
            if (call.method == "close") {
                this.finish()
            }
            if (call.method == "result") {
                val arguments = call.arguments as Map<*, *>
                val intent = Intent()
                intent.putExtra("result", arguments.get("result") as Int)
                setResult(100, intent)
                this.finish()
            }
        }
    }
}