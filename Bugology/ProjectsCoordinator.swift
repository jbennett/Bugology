//
//  ProjectsCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class ProjectsCoordinator {

  public weak var delegate: ProjectsCoordinatorDelegate?

  let presentationContext: PresentationContext

  public init(presentationContext: PresentationContext) {
    self.presentationContext = presentationContext
  }

  public func showProjectsForAccount(account: Account, client: Client) {
    let viewController = ProjectsViewController()
    viewController.delegate = self
    viewController.account = account
    viewController.client = client
    presentationContext.setStyleForService(account.serviceType)
    presentationContext.showViewController(viewController, sender: nil)
  }

}

extension ProjectsCoordinator: ProjectsViewControllerDelegate {

  public func projectsViewController(projectsViewController: ProjectsViewController, didSelectProject project: Project) {
    delegate?.projectsCoordinator(self, didSelectProject: project, inAccount: projectsViewController.account)
  }

}

public protocol ProjectsCoordinatorDelegate: class {

  func projectsCoordinator(projectsCoordinator: ProjectsCoordinator, didSelectProject project: Project, inAccount account: Account)

}
