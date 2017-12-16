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
    let cellHeight: CGFloat
    let configureCell: CellConfigurationBlock 
    let dataSourceCount: () -> Int
    let  cellType: Swift.AnyClass?
    func cellIdentifier() -> String {
        return String(describing: self.cellType)
    }
}
