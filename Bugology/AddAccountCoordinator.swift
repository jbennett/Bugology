//
//  AddAccountCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import SafariServices

public class AddAccountCoordinator {

  public weak var delegate: AddAccountCoordinatorDelegate?
  var accountRepository: AccountRepository = UserDefaultsAccountRepository()

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

  func addAccountCoordinator(addAccountCoordinator: AddAccountCoordinator, didAddAccount account: Account)

}

extension AddAccountCoordinator: AddAccountTypeViewControllerDelegate {

  public func addAccountTypeViewController(addAccountTypeViewController: AddAccountTypeViewController, didSelectService service: Service) {
    let viewController = service.loginViewController()
    viewController.delegate = self
    navigationController?.showViewController(viewController, sender: nil)
  }

}

extension AddAccountCoordinator: LoginViewControllerDelegate {

  public func loginViewController(viewController: LoginViewController, didRequestWebviewForURL url: NSURL) {
    let webview = SFSafariViewController(URL: url)
    navigationController?.showViewController(webview, sender: nil)
  }

  public func loginViewController(viewController: LoginViewController, didSubmitAccount account: Account) {
    let client = ClientFactory().clientForAccount(account)

    client.isAccountValid().map { [weak self] valid in
      if valid {
        self?.accountRepository.saveAccount(account).map { _ in
          if let this = self {
            this.delegate?.addAccountCoordinator(this, didAddAccount: account)
          }
        }
      } else {
        // todo: handle failures
      }
    }

    // todo: handle errors
  }

}
