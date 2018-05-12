//
//  ConfigurationStaticCellHeight.swift
//  EasyList
//
//  Created by Matan Cohen on 5/9/18.
//

//
//  ConfigurationAutoSizingCells.swift
//  EasyList
//
//  Created by Matan Cohen on 5/9/18.
//

import Foundation
import UIKit

//Supports multiple cell types, static height
public class ConfigurationStaticCellHeight: ConfigurationType {
    public let cellConfigurationType: (_ indexPath: IndexPath) -> CellConfigurationType
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let rowHeight: (_ forIndexPath: IndexPath) -> CGFloat

    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return ConfigurationStaticCellHeightDelegateProvider(configuration: self)
    }()

    public func configureTableView(tableView: UITableView) {
        //
    }

    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }

    public init(cellConfiguration: @escaping (_ indexPath: IndexPath) -> CellConfigurationType,
                dataSourceCount: @escaping () -> Int,
                rowHeight: @escaping (_ forIndexPath: IndexPath) -> CGFloat,
                didSelectCellBlock: @escaping DidSelectCellBlock
    ) {
        self.cellConfigurationType = cellConfiguration
        self.dataSourceCount = dataSourceCount
        self.didSelectCellBlock = didSelectCellBlock
        self.rowHeight = rowHeight
    }
}

private class ConfigurationStaticCellHeightDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var configuration: ConfigurationStaticCellHeight!

    init(configuration: ConfigurationStaticCellHeight) {
        self.configuration = configuration
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configuration.rowHeight(indexPath)
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
