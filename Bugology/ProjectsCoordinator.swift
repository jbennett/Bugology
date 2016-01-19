//
//  ProjectsCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class ProjectsCoordinator {

  let rootViewController: UIViewController

  public init(rootViewController: UIViewController) {
    self.rootViewController = rootViewController
  }

  public func showProjectsForAccount(account: Account, client: Client) {
    let viewController = ProjectsViewController()
    viewController.account = account
    viewController.client = client
    rootViewController.showViewController(viewController, sender: nil)
  }

}
