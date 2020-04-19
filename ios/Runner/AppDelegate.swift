import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 通用插件
    GeneratedPluginRegistrant.register(with: self)
    // 注册地图插件
    GLMapViewPlugin.registerWith(register: self);
//
//    // 配置通道
//    let flutter = window.rootViewController as! FlutterBinaryMessenger;
//    let channel: FlutterMethodChannel = FlutterMethodChannel(name: "samples.lyc/utils", binaryMessenger: flutter);
//    // 配置回调方法
//    channel.setMethodCallHandler { [weak self] (fc, fr) in
//        guard let stronggSelf = self else {
//            return;
//        }
//        print("flutter 给到我 method:\(fc.method) arguments:\(fc.arguments)")
//        if ("openAppMarket" == fc.method) {
//            // 打开App Store
//            let alert = UIAlertController(title: "调用原生方法打开", message: fc.method, preferredStyle: .alert);
//            let action = UIAlertAction(title: "取消", style: .cancel) { (action) in
//
//            }
//            alert.addAction(action);
//            stronggSelf.window.rootViewController?.present(alert, animated: true, completion: nil);
////            UIApplication.shared.openURL(URL(string: "itms-apps://itunes.apple.com/xy/app/foo/id414478124")!);
//            fr(0);
//        } else {
//            fr(FlutterMethodNotImplemented);
//        }
//
//    }
    
    
    
    
    
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
