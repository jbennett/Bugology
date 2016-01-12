//
//  AccountsViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

let accountCellIdentifier = "Account Cell";

public class AccountsViewController: UITableViewController {

  var dataSource = SimpleDataSource<Account>(data: [], cellIdentifier: accountCellIdentifier)

  public override func viewDidLoad() {
    super.viewDidLoad()

    title = "Accounts"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: nil)
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: accountCellIdentifier)
    dataSource.tableViewCellConfiguration = self.configureCell
    dataSource.bindToTableView(tableView)
  }

  private func configureCell(cell: UITableViewCell, account: Account) {
    cell.textLabel?.text = "\(account.serviceType): \(account.domain)"
  }

}
