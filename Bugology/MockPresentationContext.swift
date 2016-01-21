//
//  MockPresentationContext.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

// swiftlint:disable variable_name_min_length
public class MockPresentationContext: PresentationContext {

  func adsfa() {
//    let a = UIViewController()

  }

  var shownViewControllers = [UIViewController]()
  public func showViewController(vc: UIViewController, sender: AnyObject?) {
    shownViewControllers.append(vc)
  }

  var shownDetailViewControllers = [UIViewController]()
  public func showDetailViewController(vc: UIViewController, sender: AnyObject?) {
    shownDetailViewControllers.append(vc)
  }

  typealias VCCallback = (() -> Void)
  var presentedViewControllers = [UIViewController]()
  var presentedViewControllerCallbacks = [VCCallback?]()
  public func presentViewController(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
    presentedViewControllers.append(viewControllerToPresent)
    presentedViewControllerCallbacks.append(completion)
  }

}
