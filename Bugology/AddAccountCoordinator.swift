//
//  AddAccountCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class AddAccountCoordinator {

  public weak var delegate: AddAccountCoordinatorDelegate?

  let rootViewController: UIViewController
  var navigationController: UINavigationController?

  public init(rootViewController: UIViewController) {
    self.rootViewController = rootViewController
  }

  public func beginAddingAccount(animated: Bool = true) {
    let accountTypeViewController = AddAccountTypeViewController()
    accountTypeViewController.delegate = self
    navigationController = UINavigationController(rootViewController: accountTypeViewController)

    rootViewController.presentViewController(navigationController!, animated: animated, completion: nil)
  }

}

public protocol AddAccountCoordinatorDelegate: class {

}

extension AddAccountCoordinator: AddAccountTypeViewControllerDelegate {

  public func addAccountTypeViewController(addAccountTypeViewController: AddAccountTypeViewController, didSelectService service: Service) {
    let viewController = service.loginViewController()
    navigationController?.showViewController(viewController, sender: nil)
  }

}
