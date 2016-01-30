//
//  AppDelegate.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-06.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import BugKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var applicationCoordinator: ApplicationCoordinator?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window.makeKeyAndVisible()
    self.window = window

    let coordinator = ApplicationCoordinator()
    coordinator.installIntoWindow(window)
    coordinator.showAccountsList()
    self.applicationCoordinator = coordinator

    return true
  }

}
