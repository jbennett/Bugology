//
//  ProjectsViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

let projectCellIdentifier = String(UITableViewCell)

public class ProjectsViewController: UITableViewController {

  public weak var delegate: ProjectsViewControllerDelegate?

  var account: Account?
  var client: Client?
  var dataSource = SimpleDataSource<Project>(data: [], cellIdentifier: projectCellIdentifier)

  public override func viewDidLoad() {
    super.viewDidLoad()
    title = "Projects"

    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: projectCellIdentifier)
    dataSource.tableViewCellConfiguration = self.configureCell
    dataSource.bindToTableView(tableView)

    client?.getProjects().onSuccess {
      self.dataSource.data = $0
      self.tableView.reloadData()
    }
  }

  private func configureCell(cell: UITableViewCell, project: Project) {
    cell.textLabel?.text = project.name
  }
  
  public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let project = dataSource.objectAtIndexPath(indexPath)
    delegate?.projectsViewController(self, didSelectProject: project)
  }
  
}

public protocol ProjectsViewControllerDelegate: class {

  func projectsViewController(projectsViewController: ProjectsViewController, didSelectProject project: Project)

}
