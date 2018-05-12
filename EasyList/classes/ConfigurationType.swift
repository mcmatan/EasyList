//
//  EasyTableConfiguration.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public typealias SelectedCell = UITableViewCell
public typealias SelectedIndexPath = IndexPath
public typealias DidSelectCellBlock = (_ selectedCell: SelectedCell, _ selectedIndexPath: SelectedIndexPath) -> Void

public protocol ConfigurationType: class {
    func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource
    func configureTableView(tableView: UITableView)
}
