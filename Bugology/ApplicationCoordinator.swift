//
//  ApplicationCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class ApplicationCoordinator {

//  let applicationViewController = ApplicationViewController()
  let rootViewController = UINavigationController()
  let childCoordinators = CoordinatorsCollection()

  public func installIntoWindow(window: UIWindow) {
      window.rootViewController = rootViewController
  }

}

// Mark: Accounts Coordinator
extension ApplicationCoordinator: AccountsCoordinatorDelegate {

  public func showAccountsList() {
    let accountsCoordinator = AccountsCoordinator(rootViewController: rootViewController)
    accountsCoordinator.delegate = self
    accountsCoordinator.showAccounts()
    childCoordinators.addCoordinator(accountsCoordinator)
  }

  public func noAccountsForAccountCoordinator(accountsCoordinator: AccountsCoordinator) {
    let addAccountCoordinator = AddAccountCoordinator(rootViewController: rootViewController)
    addAccountCoordinator.delegate = self
    addAccountCoordinator.beginAddingAccount(false)
    childCoordinators.addCoordinator(addAccountCoordinator)
  }

  public func accountCoordinator(accountCoordinator: AccountsCoordinator, didSelectAccount account: Account) {
    let client = ClientFactory().clientForAccount(account)
    let projectsCoordinator = ProjectsCoordinator(rootViewController: rootViewController)
    projectsCoordinator.showProjectsForAccount(account, client: client)
    childCoordinators.addCoordinator(projectsCoordinator)
  }

}

// Mark: Add Account Coordinator
extension ApplicationCoordinator: AddAccountCoordinatorDelegate {

  public func addAccountCoordinator(addAccountCoordinator: AddAccountCoordinator, didAddAccount account: Account) {
    rootViewController.dismissViewControllerAnimated(true, completion: nil)

    print("reload accounts")
  }

}
