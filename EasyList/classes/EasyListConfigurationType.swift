//
//  EasyTableConfiguration.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public typealias DidSelectCellBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> Void
public protocol EasyListConfigurationType: class {
    func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource
    func configureTableView(tableView: UITableView)
}
