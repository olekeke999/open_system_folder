package ole.keke

import android.app.DownloadManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Build.VERSION_CODES
import android.os.storage.StorageManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class OpenSystemFolderPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ole.keke/open_system_folder_android")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val startDir: String? = call.argument("systemFolder");
        if (startDir == null) {
            result.success(null)
            return;
        }

        val subPath: String? = call.argument("subPath");
        val path = if (subPath != null) "$startDir/$subPath" else "$startDir/";
        var targetPath = path.replace("/", "%2F")

        if (call.method == "openSystemFolder") {
            if (Build.VERSION.SDK_INT >= VERSION_CODES.Q) {
                val storageManager = context.getSystemService(Context.STORAGE_SERVICE) as StorageManager
                val intent = storageManager.primaryStorageVolume.createOpenDocumentTreeIntent()
                var uri = intent.getParcelableExtra<Uri>("android.provider.extra.INITIAL_URI")
                var scheme = uri.toString()

                scheme = scheme.replace("/root/", "/document/")
                scheme += "%3A$targetPath"
                uri = Uri.parse(scheme)
                intent.putExtra("android.provider.extra.INITIAL_URI", uri)
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                val intentChooser = Intent.createChooser(intent, "Open folder")
                intentChooser.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context.startActivity(intentChooser)
            } else {
                val downloadIntent = Intent(DownloadManager.ACTION_VIEW_DOWNLOADS)
                downloadIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                context.startActivity(downloadIntent);
            }

            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}