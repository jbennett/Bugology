//
//  SimpleDataSource.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class SimpleDataSource<T>: NSObject, UITableViewDataSource {

  var tableView: UITableView?
  public var data: [T] {
    didSet {
      self.tableView?.reloadData()
    }
  }
  let cellIdentifier: String

  public init(data: [T], cellIdentifier: String) {
    self.data = data
    self.cellIdentifier = cellIdentifier
  }

  public func objectAtIndexPath(indexPath: NSIndexPath) -> T { // throws?
    return data[indexPath.row]
  }

  // Mark: UITableView Data Source
  public var tableViewCellConfiguration: ((UITableViewCell, T) -> Void)?

  public func bindToTableView(tableView: UITableView) { // throw if set?
    tableView.dataSource = self
    self.tableView = tableView
  }

  public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
    let object = objectAtIndexPath(indexPath)
    tableViewCellConfiguration?(cell, object)

    return cell
  }

}
