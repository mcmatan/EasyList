//
//  EasyTableConfiguration.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

public protocol EasyTableConfigurationType {
    var cellHeight: CGFloat { get }
    var configureCell: CellConfigurationBlock { get }
    var dataSourceCount: () -> Int { get }
    var  cellType: Swift.AnyClass? { get }
    func cellIdentifier() -> String
}

public struct EasyTableConfigurationSimple: EasyTableConfigurationType {
    public let cellHeight: CGFloat
    public let configureCell: CellConfigurationBlock
    public let dataSourceCount: () -> Int
    public let  cellType: Swift.AnyClass?
    public func cellIdentifier() -> String {
        return String(describing: self.cellType)
    }
}
