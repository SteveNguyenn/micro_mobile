//
//  ReactViewController.swift
//  yody_micro_swift
//
//  Created by Steve Nguyễn on 12/03/2024.
//

import UIKit
import React

class ReactViewController: UIViewController {
    
    var moduleName: String?
    var input: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("close"), object: nil, queue: .main) { [weak self] noti in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
    }
    
    func setModuleName(name: String, input: Int?) {
        moduleName = name
        self.input = input
    }
    
    override func loadView() {
        loadReactNativeView()
    }
    
    func loadReactNativeView() {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        #if DEBUG
//            jsCodeLocation = Bundle.main.url(forResource: moduleName ?? "", withExtension: "jsbundle")
        #else
            jsCodeLocation = Bundle.main.url(forResource: moduleName ?? "", withExtension: "jsbundle")
        #endif
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation!,
            moduleName: moduleName ?? "",
            initialProperties: ["input": input ?? 0],
            launchOptions: nil
        )
        self.view = rootView
    }
}
