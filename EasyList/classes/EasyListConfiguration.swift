//
// Created by Matan Cohen on 1/22/18.
//

import Foundation
import UIKit

public class EasyListConfiguration: EasyListConfigurationType {
    public var cellThemeBlock: CellThemeBlock
    public let cellSetParamsBlock: CellSetParamsBlock
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    
    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return EasyListConfigurationSimpleDelegateProvider(easyListConfigurationType: self)
    }()
    
    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }    

    public init(cellThemeBlock: @escaping CellThemeBlock,
                dataSourceCount: @escaping () -> Int,
                cellSetParamsBlock: @escaping CellSetParamsBlock,
                didSelect didSelectCellBlock: @escaping DidSelectCellBlock) {
        self.cellThemeBlock = cellThemeBlock
        self.dataSourceCount = dataSourceCount
        self.cellSetParamsBlock = cellSetParamsBlock
        self.didSelectCellBlock = didSelectCellBlock
    }
}

public class EasyListConfigurationSimpleDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var configuration: EasyListConfigurationType!
    
    init(easyListConfigurationType: EasyListConfigurationType) {
        self.configuration = easyListConfigurationType
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
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentTheme = self.configuration.cellThemeBlock(indexPath)
        return currentTheme.height
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            self.configuration.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unkown cell")
        }
    }
}
