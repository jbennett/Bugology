//
//  IssuesViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-21.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import BugKit
import SRCore

let issuesTableViewCell = String(UITableViewCell)

public class IssuesViewController: UITableViewController {

  public var client: Client?
  public weak var delegate: IssuesViewControllerDelegate?

  public var project: Project? {
    didSet {
      updateProject()
    }
  }

  private let dataSource = SimpleDataSource<Issue>(data: [], cellIdentifier: issuesTableViewCell)

  public override func viewDidLoad() {
    super.viewDidLoad()

    let bundle = NSBundle(forClass: IssuesViewController.self)
    tableView.registerNib(UINib(nibName: "IssuesCell", bundle: bundle), forCellReuseIdentifier: projectCellIdentifier)
    dataSource.tableViewCellConfiguration = self.configureCell
    dataSource.bindToTableView(tableView)

    updateProject()
  }

  func updateProject() {
    guard let project = project else { return }

    title = project.name

    client?.getIssuesForProject(project).onSuccess { issues in
      self.dataSource.data = issues.filter { $0.status != "Closed" }
      self.tableView.reloadData()
    }
  }

  func configureCell(cell: UITableViewCell, issue: Issue) {
    cell.textLabel?.text = issue.name
    cell.detailTextLabel?.text = issue.status
  }

  public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let issue = dataSource.objectAtIndexPath(indexPath)
    delegate?.issuesViewController(self, didSelectIssue: issue)
  }

}

public protocol IssuesViewControllerDelegate: class {

  func issuesViewController(viewController: IssuesViewController, didSelectIssue issue: Issue)

}
