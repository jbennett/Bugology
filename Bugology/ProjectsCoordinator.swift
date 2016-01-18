//
//  ProjectsCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class ProjectsCoordinator {
  
  let account: Account
  let client: Client
  let rootViewController: UIViewController
  
  public init(account: Account, client: Client, rootViewController: UIViewController) {
    self.account = account
    self.client = client
    self.rootViewController = rootViewController
  }
  
  
  public func showProjects() {
    let viewController = ProjectsViewController()
    rootViewController.showViewController(viewController, sender: nil)
  }

}