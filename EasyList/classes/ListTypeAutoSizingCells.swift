//
// Created by Matan Cohen on 1/22/18.
//

import Foundation
import UIKit

//Supports multiple cell types, dynamic cell height
public class ListTypeAutoSizingCells: ListType {
    public let cellConfigurationType: (_ indexPath: IndexPath) -> CellConfigurationType
    public let didSelectCellBlock: DidSelectCellBlock
    public let dataSourceCount: () -> Int
    public let estimatedRowsHeight: CGFloat

    lazy var dataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource = {
        return ListTypeAutoSizingCellsDataDelegateProvider(listType: self)
    }()

    public func configureTableView(tableView: UITableView) {
        tableView.estimatedRowHeight = self.estimatedRowsHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    public func getDataSourceAndDelegate() -> UITableViewDelegate & UITableViewDataSource {
        return self.dataSourceAndDelegate
    }

    public init(
            cellConfiguration: @escaping (_ indexPath: IndexPath) -> CellConfigurationType,
            dataSourceCount: @escaping () -> Int,
            estimatedRowsHeight: CGFloat,
            didSelectCellBlock: @escaping DidSelectCellBlock
    ) {
        self.cellConfigurationType = cellConfiguration
        self.estimatedRowsHeight = estimatedRowsHeight
        self.dataSourceCount = dataSourceCount
        self.didSelectCellBlock = didSelectCellBlock
    }
}

private class ListTypeAutoSizingCellsDataDelegateProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var listType: ListTypeAutoSizingCells!

    init(listType: ListTypeAutoSizingCells) {
        self.listType = listType
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listType.dataSourceCount()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurationForIndexPath = self.listType.cellConfigurationType(indexPath)
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
            self.listType.didSelectCellBlock(isCell, indexPath)
        } else {
            print("ERROR: EasyList did select unknown cell")
        }
    }
}
