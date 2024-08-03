import Flutter
import UIKit

public class OpenSystemFolderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ole.keke/open_system_folder_ios", binaryMessenger: registrar.messenger())
    let instance = OpenSystemFolderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "openSystemFolder") {
          let fileManager = FileManager.default
          do {
              var subPath = ""
              if let dictionary = call.arguments as? Dictionary<String, Any>,
              let _subPath = dictionary["subPath"] as? String {
                  subPath = _subPath
              }
              
              let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
              let targetFolderUrl = subPath.isEmpty ? documentsDirectory : documentsDirectory.appendingPathComponent(subPath, isDirectory: true)
             
              if fileManager.fileExists(atPath: targetFolderUrl.path),
                 let sharedUrl = URL(string: "shareddocuments://\(targetFolderUrl.path)"),
                 UIApplication.shared.canOpenURL(sharedUrl)
              {
                  UIApplication.shared.open(sharedUrl, options: [:])
              }
          }
          catch (_) {}
      } else {
          result(FlutterMethodNotImplemented)
      }
      result(nil)
  }
}
