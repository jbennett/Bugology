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

}

extension UIViewController: PresentationContext {}
