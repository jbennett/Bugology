//
//  IssuesViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-21.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

let issuesTableViewCell = String(UITableViewCell)

public class IssuesViewController: UITableViewController {

  var client: Client?

  public var project: Project? {
    didSet {
      updateProject()
    }
  }

  private let dataSource = SimpleDataSource<Issue>(data: [], cellIdentifier: issuesTableViewCell)

  public override func viewDidLoad() {
    super.viewDidLoad()

    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: projectCellIdentifier)
    dataSource.tableViewCellConfiguration = self.configureCell
    dataSource.bindToTableView(tableView)

    updateProject()
  }

  func updateProject() {
    guard let project = project else { return }

    title = project.name

    client?.getIssuesForProject(project).onSuccess { issues in
      print(issues)
      self.dataSource.data = issues
      self.tableView.reloadData()
    }
  }

  func configureCell(cell: UITableViewCell, issue: Issue) {
    cell.textLabel?.text = issue.name
  }

}
