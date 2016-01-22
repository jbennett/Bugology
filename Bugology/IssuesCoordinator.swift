//
//  IssuesCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-21.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class IssuesCoordinator {

  public weak var delegate: IssuesCoordinatorDelegate?

  let presentationContext: PresentationContext

  public init(presentationContext: PresentationContext) {
    self.presentationContext = presentationContext
  }

  public func showIssuesForProject(project: Project, client: Client) {
    let viewController = IssuesViewController()
    viewController.project = project

    presentationContext.showViewController(viewController, sender: self)
  }

}

public protocol IssuesCoordinatorDelegate: class {
}
