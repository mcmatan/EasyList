//
//  EasyConfiguration.swift
//  EasyList
//
//  Created by Matan Cohen on 5/9/18.
//

//
//  EasyListAutoSizeCellConfiguration.swift
//  EasyList
//
//  Created by Matan Cohen on 5/9/18.
//

import Foundation

class SomeCell: UITableViewCell {
    
}

public protocol ICellConfiguration {
    var configure: ((_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell) { get }
    var type: Swift.AnyClass { get }
}

public class CellConfiguration<T>: ICellConfiguration {
    public let configure: ((_ cell:UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell)
    public let type: Swift.AnyClass
    
    public init(configure: @escaping ((_ cell:T, _ indexPath: IndexPath) -> T) ) {
        self.type = T.self as! AnyClass
        self.configure = configure as! ((_ cell: UITableViewCell, _ indexPath: IndexPath) -> UITableViewCell)
    }
}

public class EasyListConfiguration: EasyListConfigurationType {
    
    public var cellThemeBlock: CellThemeBlock
    public let cellSetParamsBlock: CellSetParamsBlock
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    
    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return EasyListConfigurationSimpleDelegateProvider(easyListConfiguration: self)
    }()
    
    public func configureTableView(tableView: UITableView) {
        //
    }
    
    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }
    
    public init(cellThemeBlock: @escaping CellThemeBlock,
                dataSourceCount: @escaping () -> Int,
                cellSetParamsBlock: @escaping CellSetParamsBlock,
                didSelect didSelectCellBlock: @escaping DidSelectCellBlock
        ) {
        self.cellThemeBlock = cellThemeBlock
        self.dataSourceCount = dataSourceCount
        self.cellSetParamsBlock = cellSetParamsBlock
        self.didSelectCellBlock = didSelectCellBlock
    }
}

public class EasyListConfigurationSimpleDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var configuration: EasyListConfiguration!
    
    init(easyListConfiguration: EasyListConfiguration) {
        self.configuration = easyListConfiguration
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configuration.cellThemeBlock(indexPath).height
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configuration.dataSourceCount()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTheme = self.configuration.cellThemeBlock(indexPath)
        let cellIdentidier = currentTheme.cellIdentifier
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentidier)
        if cell === nil {
            tableView.register(currentTheme.type.self!, forCellReuseIdentifier: cellIdentidier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier)
            if cell === nil {
                assertionFailure("No matching cell")
            }
        }
        
        return self.configuration.cellSetParamsBlock(cell!, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            self.configuration.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unkown cell")
        }
    }
}
