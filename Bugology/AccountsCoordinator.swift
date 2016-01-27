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
  let presentationContext: PresentationContext

  public init(presentationContext: PresentationContext) {
    self.presentationContext = presentationContext
  }

  public func showAccounts() {
    accountsViewController = AccountsViewController()
    accountsViewController?.delegate = self
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

  public func didTapAddAccountOnAccountsViewController(viewController: AccountsViewController) {
    delegate?.didTapAddAccountOnAccountsCoordinator(self)
  }

}


public protocol AccountsCoordinatorDelegate: class {

  func noAccountsForAccountCoordinator(accountsCoordinator: AccountsCoordinator)
  func accountCoordinator(accountCoordinator: AccountsCoordinator, didSelectAccount account: Account)
  func didTapAddAccountOnAccountsCoordinator(accountsCoordinator: AccountsCoordinator)

}
