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

}
