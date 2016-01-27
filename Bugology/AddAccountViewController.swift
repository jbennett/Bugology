//
//  AddAccountViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class AddAccountTypeViewController: UITableViewController {

  public weak var delegate: AddAccountTypeViewControllerDelegate?
  public var cancellable: Bool = true {
    didSet { updateNavButtons() }
  }

  let dataSource = SimpleDataSource<Service>(data: Service.allServices(), cellIdentifier: "Basic Cell")

  public override func viewDidLoad() {
    super.viewDidLoad()
    title = "Account Types"

    dataSource.tableViewCellConfiguration = self.configureCell
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Basic Cell")
    dataSource.bindToTableView(tableView)
  }

  lazy var cancelButton: UIBarButtonItem = { UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "didTapCancel") }()
  func updateNavButtons() {
    if cancellable {
      navigationItem.leftBarButtonItem = cancelButton
    } else {
      navigationItem.leftBarButtonItem = nil
    }
  }

  @IBAction private func didTapCancel() {
    delegate?.didTapCancelOnAccountTypeViewController(self)
  }

  func configureCell(cell: UITableViewCell, service: Service) {
    cell.textLabel?.text = service.rawValue
  }

  public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let service = dataSource.objectAtIndexPath(indexPath)
    delegate?.addAccountTypeViewController(self, didSelectService: service)
  }

}

public protocol AddAccountTypeViewControllerDelegate: class {

  func addAccountTypeViewController(addAccountTypeViewController: AddAccountTypeViewController, didSelectService service: Service)
  func didTapCancelOnAccountTypeViewController(viewController: AddAccountTypeViewController)

}
