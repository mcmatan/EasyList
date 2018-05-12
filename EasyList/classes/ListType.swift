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

public protocol ListType: class {
    func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource
    func configureTableView(tableView: UITableView)
    var cellConfigurationType: (_ indexPath: IndexPath) -> CellConfigurationType { get }
}

func reuseCellFor(indexPath: IndexPath, tableView: UITableView ,listType: ListType) -> UITableViewCell {
    let cellConfigurationForIndexPath = listType.cellConfigurationType(indexPath)
    let identifier = String(describing: cellConfigurationForIndexPath.type)
    var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
    if cell === nil {
        tableView.register(cellConfigurationForIndexPath.type.self, forCellReuseIdentifier: identifier)
        cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell === nil {
            assertionFailure("No matching cell")
        }
    }
    return cell!
}
