//
//  IssueCoordinator.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-28.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import BugKit

public class IssueCoordinator {

  let presentationContext: PresentationContext
  public init(presentationContext: PresentationContext) {
    self.presentationContext = presentationContext
  }

  public func showIssue(issue: Issue) {
    let viewController = UIViewController()
    viewController.title = issue.name

    presentationContext.showViewController(viewController, sender: nil)
  }

}

public protocol IssueCoordinatorDelegate {

}
