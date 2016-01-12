//
//  AccountsCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class AccountsCoordinator {

  public weak var delegate: AccountsCoordinatorDelegate?
  var accountRepository: AccountRepository = UserDefaultsAccountRepository()

  var accountsViewController: AccountsViewController?
  let rootViewController: UIViewController

  public init(rootViewController: UIViewController) {
    self.rootViewController = rootViewController
  }

  public func showAccounts() {
    accountsViewController = AccountsViewController()
    rootViewController.showViewController(accountsViewController!, sender: nil)

    accountRepository.getAccounts().onSuccess { accounts in
      if accounts.count == 0 {
        self.delegate?.noAccountsForAccountCoordinator(self)
      }
      
      self.accountsViewController?.dataSource.data = accounts
    }
  }

}


public protocol AccountsCoordinatorDelegate: class {

  func noAccountsForAccountCoordinator(accountsCoordinator: AccountsCoordinator)

}
