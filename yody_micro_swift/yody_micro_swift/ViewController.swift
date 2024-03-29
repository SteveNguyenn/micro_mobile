//
//  ViewController.swift
//  yody_micro_swift
//
//  Created by Steve Nguyễn on 12/03/2024.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    @IBOutlet weak var foodResult: UILabel!
    @IBOutlet weak var profileResult: UILabel!
    @IBOutlet weak var loginResult: UILabel!
    @IBOutlet weak var employeeResult: UILabel!
    
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var loginChannel : FlutterMethodChannel?
    var profileChannel : FlutterMethodChannel?
    
    @IBAction func loginFlutterTap(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          //get engine and run engine
          let engine = delegate.loginEngine
          engine?.run(withEntrypoint: "main", libraryURI: "package:yody_umbrella/main.dart", initialRoute: "/yody_login")
          let window = delegate.window
          //init controller
          let flutterController = FlutterViewController(engine: engine!, nibName: nil, bundle: nil)
          self.loginChannel = FlutterMethodChannel.init(name: "login", binaryMessenger: flutterController.binaryMessenger)
          flutterController.modalPresentationStyle = .fullScreen
          window?.rootViewController?.present(flutterController, animated: true)
          //send data to flutter
          self.loginChannel?.invokeMethod("init", arguments: ["input": Int(loginResult?.text ?? "")])
          self.loginChannel?.setMethodCallHandler({ [weak self] call, result in
            guard let self = self else { return }
            if (call.method == "result") {
                if let arguments = call.arguments as? [String: Any], let flutterResultText = arguments["result"] as? Int {
                    self.loginResult.text = "\(flutterResultText)"
                    flutterController.dismiss(animated: true)
                }
            }
            if (call.method == "close") {
              //invoke result react native function
              //close if need
              flutterController.dismiss(animated: true)
            }
          })
        }

    }
    @IBAction func foodReactNativeTapped(_ sender: Any) {
        let vc = ReactViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.setModuleName(name: "yody_food", input: Int(foodResult.text ?? ""))
        self.present(vc, animated: true)
    }
    
    @IBAction func employeeReactNativeTapped(_ sender: Any) {
        let vc = ReactViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.setModuleName(name: "yody_employee", input: Int(employeeResult.text ?? ""))
        self.present(vc, animated: true)
    }
    
    @IBAction func profileFlutterTap(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          //get engine and run engine
          let engine = delegate.profileEngine
            engine?.run(withEntrypoint: "main", libraryURI: "package:yody_umbrella/main.dart", initialRoute: "/yody_profile")
          let window = delegate.window
          //init controller
          let flutterController = FlutterViewController(engine: engine!, nibName: nil, bundle: nil)
          self.profileChannel = FlutterMethodChannel.init(name: "profile", binaryMessenger: flutterController.binaryMessenger)
          flutterController.modalPresentationStyle = .fullScreen
          window?.rootViewController?.present(flutterController, animated: true)
          //send data to flutter
          self.profileChannel?.setMethodCallHandler({ [weak self] call, result in
              if (call.method == "result") {
                  if let arguments = call.arguments as? [String: Any], let flutterResultText = arguments["result"] as? Int {
                      self?.profileResult.text = "\(flutterResultText)"
                      flutterController.dismiss(animated: true)
                  }
              } else {
                  flutterController.dismiss(animated: true)
              }
          })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("employee_updated"), object: nil, queue: .main) { [weak self] notification in
            if let userInfo = notification.userInfo, let result = userInfo["result"] {
                guard let self = self else { return }
                self.employeeResult.text = "\(result)"
            }
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name("food_updated"), object: nil, queue: .main) { [weak self] notification in
            if let userInfo = notification.userInfo as? [String: Any], let result = userInfo["result"]  {
                guard let self = self else { return }
                self.foodResult.text = "\(result)"
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

