//
//  ApplicationViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

class XApplicationViewController: UIViewController {

  var rootViewController: UIViewController? {
    didSet {
      if let oldValue = oldValue {
        oldValue.willMoveToParentViewController(nil)
        oldValue.view.removeFromSuperview()
        oldValue.removeFromParentViewController()
      }

      if let rootViewController = rootViewController {
        rootViewController.willMoveToParentViewController(self)

      }
    }
  }

}
