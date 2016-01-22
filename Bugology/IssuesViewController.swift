//
//  IssuesViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-21.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class IssuesViewController: UITableViewController {

  public var project: Project? {
    didSet {
      updateProject()
    }
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    updateProject()
  }

  func updateProject() {
    guard let project = project else { return }

    title = project.name
  }

}
