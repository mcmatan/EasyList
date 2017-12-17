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

public protocol EasyListConfigurationType {
    var cellHeight: CGFloat { get }
    var configureCell: CellConfigurationBlock { get }
    var didSelectCellBlock: DidSelectCellBlock { get }
    var dataSourceCount: () -> Int { get }
    var  cellType: Swift.AnyClass? { get }
    func cellIdentifier() -> String
}

public struct EasyListConfigurationSimple: EasyListConfigurationType {
    public let cellHeight: CGFloat
    public let configureCell: CellConfigurationBlock
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let  cellType: Swift.AnyClass?
    public func cellIdentifier() -> String {
        return String(describing: self.cellType)
    }
    
    public init(cellHeight: CGFloat, configureCell: @escaping CellConfigurationBlock, dataSourceCount: @escaping () -> Int, cellType: Swift.AnyClass?, didSelectCellBlock: @escaping DidSelectCellBlock) {
        self.didSelectCellBlock = didSelectCellBlock
        self.cellHeight = cellHeight
        self.configureCell = configureCell
        self.dataSourceCount = dataSourceCount
        self.cellType = cellType
    }
}
