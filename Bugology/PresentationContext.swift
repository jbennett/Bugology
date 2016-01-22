//
//  PresentationContext.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

// swiftlint:disable variable_name_min_length
public protocol PresentationContext {

  func showViewController(vc: UIViewController, sender: AnyObject?)
  func showDetailViewController(vc: UIViewController, sender: AnyObject?)
  func presentViewController(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)

  func setStyleForService(service: Service?)

}

extension UIViewController: PresentationContext {

  public func setStyleForService(service: Service?) {
    let navigationController = self as? UINavigationController ?? self.navigationController
    guard let navigationBar = navigationController?.navigationBar else { return }

    if let service = service {
      navigationBar.barTintColor = service.primaryServiceColor()
      navigationBar.titleTextAttributes = [
        NSForegroundColorAttributeName: service.primaryServiceTextColor()
      ]
      navigationBar.tintColor = service.primaryServiceTextColor()
    } else {

    }
  }

}
