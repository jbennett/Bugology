//
//  AddAccountViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class AddAccountTypeViewController: UITableViewController {

  let dataSource = SimpleDataSource<Service>(data: Service.allServices(), cellIdentifier: "Basic Cell")

  public override func viewDidLoad() {
    super.viewDidLoad()
    title = "Account Types"

    dataSource.tableViewCellConfiguration = self.configureCell
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Basic Cell")
    dataSource.bindToTableView(tableView)
  }

  func configureCell(cell: UITableViewCell, service: Service) {
    cell.textLabel?.text = service.rawValue
  }
  }

}
