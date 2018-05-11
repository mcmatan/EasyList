//
//  CellConfiguration.swift
//  EasyList
//
//  Created by Matan Cohen on 5/11/18.
//

import Foundation
import UIKit

public protocol CellConfigurationType {
    var configure: ((_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell) { get }
    var type: Swift.AnyClass { get }
}

public class CellConfiguration<T>: CellConfigurationType {
    public var configure: ((_ cell:UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell) {
        get {
            return { (cell , indexPath) -> UITableViewCell in
                
                if let isSameType = cell as? T {
                    let configuredCell = self.configureMy(isSameType, indexPath)
                    return configuredCell as! UITableViewCell
                } else {
                    assertionFailure("Not correct type cell")
                    return UITableViewCell()
                }
                
            }
        }
    }
    public var configureMy: ((_ cell:T, _ indexPath: IndexPath) -> T)
    public let type: Swift.AnyClass
    
    
    public init(configure: @escaping ((_ cell:T, _ indexPath: IndexPath) -> T) ) {
        self.type = T.self as! AnyClass
        self.configureMy = configure
        
    }
}
