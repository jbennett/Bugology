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
  public let nextHandler: MessageHandler? = nil

  public func installIntoWindow(window: UIWindow) {
      window.rootViewController = rootViewController
  }

}

extension ApplicationCoordinator: MessageHandler {

  public func handleMessage(message: Message) {
    switch message {
    case is OpenAddAccountMessage: showAddAccounts()
    default:
      nextHandler?.handleMessage(message)
    }
  }

}

// Mark: Accounts Coordinator
extension ApplicationCoordinator: AccountsCoordinatorDelegate {

  public func showAccountsList() {
    let accountsCoordinator = AccountsCoordinator(presentationContext: rootViewController)
    accountsCoordinator.messageHandler = self
    accountsCoordinator.delegate = self
    accountsCoordinator.showAccounts()
    childCoordinators.addCoordinator(accountsCoordinator)
  }

  public func noAccountsForAccountCoordinator(accountsCoordinator: AccountsCoordinator) {
    showAddAccounts(false)
  }

  public func accountCoordinator(accountCoordinator: AccountsCoordinator, didSelectAccount account: Account) {
    let client = ClientFactory().clientForAccount(account)
    let projectsCoordinator = ProjectsCoordinator(presentationContext: rootViewController)
    projectsCoordinator.delegate = self
    projectsCoordinator.showProjectsForAccount(account, client: client)
    childCoordinators.addCoordinator(projectsCoordinator)
  }

}

// Mark: Add Account Coordinator
extension ApplicationCoordinator: AddAccountCoordinatorDelegate {

  public func showAddAccounts(cancellable: Bool = true) {
    let addAccountCoordinator = AddAccountCoordinator(presentationContext: rootViewController)
    addAccountCoordinator.delegate = self
    addAccountCoordinator.beginAddingAccount(cancellable)
    childCoordinators.addCoordinator(addAccountCoordinator)
  }

  public func addAccountCoordinator(addAccountCoordinator: AddAccountCoordinator, didAddAccount account: Account) {
    rootViewController.dismissViewControllerAnimated(true, completion: nil)
  }

  public func didCancelAddAccount(addAccountCoordinator: AddAccountCoordinator) {
    rootViewController.dismissViewControllerAnimated(true, completion: nil)
  }

}

extension ApplicationCoordinator: ProjectsCoordinatorDelegate {

  public func projectsCoordinator(projectsCoordinator: ProjectsCoordinator, didSelectProject project: Project, inAccount account: Account) {
    let client = ClientFactory().clientForAccount(account)
    let issuesCoordinator = IssuesCoordinator(presentationContext: rootViewController)
    issuesCoordinator.delegate = self
    issuesCoordinator.showIssuesForProject(project, client: client)
    childCoordinators.addCoordinator(issuesCoordinator)
  }
}

extension ApplicationCoordinator: IssuesCoordinatorDelegate {

}
