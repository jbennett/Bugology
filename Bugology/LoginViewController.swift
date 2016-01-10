//
//  LoginViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-10.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {

  public weak var delegate: LoginViewControllerDelegate?

  public class func fromStoryboard() -> UIViewController {
    fatalError("Implementation required in subclass")
  }

}

public protocol LoginViewControllerDelegate: class {

  func loginViewController(viewController: LoginViewController, didRequestWebviewForURL url: NSURL)

}

//public protocol SifterLoginViewControllerDelegate: class {
//  
//  func didRequestTokenPageForSifterLoginViewController(loginViewController: SifterLoginViewController)
//  func authRequestForSifterLoginViewController(loginViewController: SifterLoginViewController)
//  
//}
