import android.app.Application
import android.content.Context
import android.content.res.Resources
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.shell.MainPackageConfig
import com.facebook.react.shell.MainReactPackage
import java.util.Arrays

class PackageList {
    private var application: Application? = null
    private var reactNativeHost: ReactNativeHost?
    private var mConfig: MainPackageConfig?

    @JvmOverloads
    constructor(reactNativeHost: ReactNativeHost?, config: MainPackageConfig? = null) {
        this.reactNativeHost = reactNativeHost
        mConfig = config
    }

    @JvmOverloads
    constructor(application: Application?, config: MainPackageConfig? = null) {
        reactNativeHost = null
        this.application = application
        mConfig = config
    }

    private val resources: Resources
        private get() = getApplication()!!.resources

    private fun getApplication(): Application? {
        return application
    }

    private val applicationContext: Context
        private get() = getApplication()!!.applicationContext
    val packages: ArrayList<ReactPackage>
        get() = ArrayList(
            Arrays.asList<ReactPackage>(
                MainReactPackage(mConfig)
            )
        )
}