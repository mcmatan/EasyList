//
//  EasyTableConfiguration.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public struct CellTheme {
    public let height: CGFloat
    public let type: Swift.AnyClass?
    public let cellIdentifier: String
    
    public init(
        height: CGFloat,
        type: Swift.AnyClass?,
        cellIdentifier: String
        ) {
        self.height = height
        self.type = type
        self.cellIdentifier = cellIdentifier
    }
}

public struct CellAutoSizeTheme {
    public let type: Swift.AnyClass?
    public let cellIdentifier: String
    
    public init(
    
        type: Swift.AnyClass?,
        cellIdentifier: String
        ) {
        self.type = type
        self.cellIdentifier = cellIdentifier
    }
}

public typealias CellSetParamsBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell
public typealias CellThemeBlock = (_ indexPath: IndexPath) -> CellTheme
public typealias DidSelectCellBlock = (_ cell: UITableViewCell, _ indexPath: IndexPath) -> Void
public typealias CellAutoSizeThemeBlock = (_ indexPath: IndexPath) -> CellAutoSizeTheme


public protocol EasyListConfigurationType: class {
    func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource
    func configureTableView(tableView: UITableView)
}
