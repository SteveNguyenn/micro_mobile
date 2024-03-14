import com.example.yody_micro_android.FoodActivity
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod


class YodyFoodModule(reactContext: ReactApplicationContext?) :
    ReactContextBaseJavaModule(reactContext) {
    override fun getName(): String {
        return "YodyFoodBridge"
    }
    @ReactMethod
    fun close(promise: Promise) {
        FoodActivity.fa?.finish()
    }
}