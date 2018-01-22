//
//  EasyTableConfiguration.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public typealias CellConfigurationBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell
public typealias DidSelectCellBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> Void

public protocol EasyListConfigurationType: class {
    var cellHeight: CGFloat { get }
    var configureCell: CellConfigurationBlock { get }
    var didSelectCellBlock: DidSelectCellBlock { get }
    var dataSourceCount: () -> Int { get }
    var cellType: Swift.AnyClass? { get }
    func cellIdentifier() -> String
    func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource 
}
