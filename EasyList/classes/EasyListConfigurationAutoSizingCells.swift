//
// Created by Matan Cohen on 1/22/18.
//

import Foundation
import UIKit

public class EasyListConfigurationAutoSizingCells: EasyListConfigurationType {
    public let cellConfigurationType: (_ indexPath: IndexPath) -> CellConfigurationType
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let estimatedHeight: CGFloat
    
    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return AutoSizingCellsDataDelegateProvider(configuration: self)
    }()
    
    public func configureTableView(tableView: UITableView) {
        tableView.estimatedRowHeight = self.estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }

    public init(
            cellConfigurationType: @escaping (_ indexPath: IndexPath) -> CellConfigurationType,
            dataSourceCount: @escaping () -> Int,
            estimatedHeight: CGFloat,
            didSelectCellBlock: @escaping DidSelectCellBlock
                ) {
        self.cellConfigurationType = cellConfigurationType
        self.estimatedHeight = estimatedHeight
        self.dataSourceCount = dataSourceCount
        self.didSelectCellBlock = didSelectCellBlock
    }
}

public class AutoSizingCellsDataDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var configuration: EasyListConfigurationAutoSizingCells!
    
    init(configuration: EasyListConfigurationAutoSizingCells) {
        self.configuration = configuration
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configuration.dataSourceCount()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurationForIndexPath = self.configuration.cellConfigurationType(indexPath)
        let identifier = String(describing: cellConfigurationForIndexPath.type)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell === nil {
            tableView.register(cellConfigurationForIndexPath.type.self, forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            if cell === nil {
                assertionFailure("No matching cell")
            }
        }
        
        return cellConfigurationForIndexPath.configure(cell!, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            self.configuration.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unknown cell")
        }
    }
}
