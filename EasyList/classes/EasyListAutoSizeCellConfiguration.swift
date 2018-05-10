//
// Created by Matan Cohen on 1/22/18.
//

import Foundation
import UIKit

public class EasyListAutoSizeCellConfiguration: EasyListConfigurationType {
    public let iCellConfigurationForIndexPath : (_ indexPath: IndexPath) -> ICellConfiguration
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let estimatedHeight: CGFloat
    
    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return EasyListAutoSizeCellConfigurationDelegateProvider(configuration: self)
    }()
    
    public func configureTableView(tableView: UITableView) {
        tableView.estimatedRowHeight = self.estimatedHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }

    public init(
                iCellConfigurationForIndexPath : @escaping (_ indexPath: IndexPath) -> ICellConfiguration,
                dataSourceCount: @escaping () -> Int,
                didSelect didSelectCellBlock: @escaping DidSelectCellBlock,
                estimatedHeight: CGFloat
                ) {
        self.iCellConfigurationForIndexPath = iCellConfigurationForIndexPath
        self.estimatedHeight = estimatedHeight
        self.dataSourceCount = dataSourceCount
        self.didSelectCellBlock = didSelectCellBlock
    }
}

public class EasyListAutoSizeCellConfigurationDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var configuration: EasyListAutoSizeCellConfiguration!
    
    init(configuration: EasyListAutoSizeCellConfiguration) {
        self.configuration = configuration
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.configuration.dataSourceCount()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurationForIndexPath = self.configuration.iCellConfigurationForIndexPath(indexPath)
        let cellIdentidier = String(describing: cellConfigurationForIndexPath.type)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier)
        if cell === nil {
            tableView.register(cellConfigurationForIndexPath.type.self, forCellReuseIdentifier: cellIdentidier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier)
            if cell === nil {
                assertionFailure("No matching cell")
            }
        }
        
        return cellConfigurationForIndexPath.configure(cell!, indexPath) as! UITableViewCell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            self.configuration.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unkown cell")
        }
    }
}
