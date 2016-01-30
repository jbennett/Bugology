//
//  IssuesCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-21.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import BugKit
import BugUIKit

public class IssuesCoordinator {

  public weak var delegate: IssuesCoordinatorDelegate?

  let presentationContext: PresentationContext

  public init(presentationContext: PresentationContext) {
    self.presentationContext = presentationContext
  }

  public func showIssuesForProject(project: Project, client: Client) {
    let viewController = IssuesViewController()
    viewController.delegate = self
    viewController.client = client
    viewController.project = project

    presentationContext.showViewController(viewController, sender: self)
  }

}

extension IssuesCoordinator: IssuesViewControllerDelegate {

  public func issuesViewController(viewController: IssuesViewController, didSelectIssue issue: Issue) {
    delegate?.issuesCoordinator(self, didSelectIssue: issue)
  }

}

public protocol IssuesCoordinatorDelegate: class {

  func issuesCoordinator(issuesCoordinator: IssuesCoordinator, didSelectIssue issue: Issue)

}
