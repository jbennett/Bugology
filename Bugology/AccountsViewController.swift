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

  public weak var messageHandler: MessageHandler?
  public weak var delegate: AccountsViewControllerDelegate?
  var dataSource = SimpleDataSource<Account>(data: [], cellIdentifier: accountCellIdentifier)

  public override func viewDidLoad() {
    super.viewDidLoad()

    title = "Accounts"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "didTapAdd")
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: accountCellIdentifier)
    dataSource.tableViewCellConfiguration = self.configureCell
    dataSource.bindToTableView(tableView)
  }

  public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let account = dataSource.objectAtIndexPath(indexPath)
    delegate?.accountsViewController(self, didSelectAccount: account)
  }

  @IBAction private func didTapAdd() {
    messageHandler?.handleMessage(OpenAddAccountMessage())
  }

  private func configureCell(cell: UITableViewCell, account: Account) {
    cell.textLabel?.text = "\(account.serviceType): \(account.domain)"
  }

}

public protocol AccountsViewControllerDelegate: class {

  func accountsViewController(viewController: AccountsViewController, didSelectAccount account: Account)

}
