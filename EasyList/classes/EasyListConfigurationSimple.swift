//
// Created by Matan Cohen on 1/22/18.
//

import Foundation
import UIKit

public class EasyListConfigurationSimple: EasyListConfigurationType {
    public let cellHeight: CGFloat
    public let configureCell: CellConfigurationBlock
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let cellType: Swift.AnyClass?
    
    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return EasyListConfigurationSimpleDelegateProvider(easyListConfigurationType: self)
    }()
    
    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }

    public func cellIdentifier() -> String {
        return String(describing: self.cellType)
    }

    public init(cellHeight: CGFloat,
                configureCell: @escaping CellConfigurationBlock,
                dataSourceCount: @escaping () -> Int,
                cellType: Swift.AnyClass?,
                didSelectCellBlock: @escaping DidSelectCellBlock) {
        self.didSelectCellBlock = didSelectCellBlock
        self.cellHeight = cellHeight
        self.configureCell = configureCell
        self.dataSourceCount = dataSourceCount
        self.cellType = cellType
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
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.configuration.cellIdentifier()) else {
            return UITableViewCell()
        }
        return self.configuration.configureCell(cell, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configuration.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            self.configuration.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unkown cell")
        }
    }
}
