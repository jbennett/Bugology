//
//  AccountsCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class AccountsCoordinator {

  public weak var messageHandler: MessageHandler?
  public weak var delegate: AccountsCoordinatorDelegate?
  var accountRepository: AccountRepository = UserDefaultsAccountRepository()

  var accountsViewController: AccountsViewController?
  let presentationContext: PresentationContext

  public init(presentationContext: PresentationContext) {
    self.presentationContext = presentationContext
  }

  public func showAccounts() {
    accountsViewController = AccountsViewController()
    accountsViewController?.delegate = self
    accountsViewController?.messageHandler = messageHandler
    presentationContext.showViewController(accountsViewController!, sender: nil)

    accountRepository.getAccounts().onSuccess { accounts in
      if accounts.count == 0 {
        self.delegate?.noAccountsForAccountCoordinator(self)
      }

      self.accountsViewController?.dataSource.data = accounts
    }
  }

}

extension AccountsCoordinator: AccountsViewControllerDelegate {

  public func accountsViewController(viewController: AccountsViewController, didSelectAccount account: Account) {
    delegate?.accountCoordinator(self, didSelectAccount: account)
  }

}


public protocol AccountsCoordinatorDelegate: class {

  func noAccountsForAccountCoordinator(accountsCoordinator: AccountsCoordinator)
  func accountCoordinator(accountCoordinator: AccountsCoordinator, didSelectAccount account: Account)

}
